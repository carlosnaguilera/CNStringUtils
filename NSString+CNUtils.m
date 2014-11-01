//
//  NSString+CNUtils.m
//  
//
//  Created by Carlos Nuñez on 16/10/14.
//
//

#import "NSString+CNUtils.h"

@implementation NSString (CNUtils)

- (BOOL)isNumber {
  
  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  [formatter setLocale:[NSLocale currentLocale]];
  
  if ([formatter numberFromString:self]) {
    return YES;
  }
  else {
    return NO;
  }
}

- (BOOL)isValidEmail
{
  BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
  NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
  NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
  NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
  NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
  return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidPhoneNumber {
  
  NSError *error = nil;
  NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error];
  
  NSRange inputRange = NSMakeRange(0, [self length]);
  NSArray *matches = [detector matchesInString:self options:NSMatchingAnchored range:inputRange];
  
  // no match at all
  if ([matches count] == 0) {
    return NO;
  }
  
  // found match but we need to check if it matched the whole string
  NSTextCheckingResult *result = (NSTextCheckingResult *)[matches objectAtIndex:0];
  
  if ([result resultType] == NSTextCheckingTypePhoneNumber && result.range.location == inputRange.location && result.range.length == inputRange.length) {
    // it matched the whole string
    return YES;
  }
  else {
    // it only matched partial string
    return NO;
  }
}

- (BOOL)contains:(NSString *)subString {
  
  NSRange range = [self rangeOfString:subString];
  if (range.location == NSNotFound) {
    return NO;
  }
  else {
    return YES;
  }
}

- (NSArray *)componentsBetweenString:(NSString*) initialString andString:(NSString*) finalString remainTexts:(BOOL)remainsText {
    
    if (!initialString || !finalString)
        return nil;
    
    // Create a string to work with it
    NSMutableString *stringAux = [[NSMutableString alloc] initWithCapacity:[self length]];
    [stringAux setString:self];
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    // Retrieve the first component between initialString and finalString
    
    NSRange startRange = [stringAux rangeOfString:initialString];
    
    if (startRange.location == NSNotFound) {
        NSLog(@"%@ doesn't appear in %@", initialString, self);
        return nil;
    }
    
    // targetRange stores the range where we look for the first occurrence of finalString
    NSRange targetRange;
    
    targetRange.location = startRange.location + startRange.length;
    targetRange.length = [stringAux length] - targetRange.location;
    
    NSRange endRange = [stringAux rangeOfString:finalString options:0 range:targetRange];
    
    if (endRange.location == NSNotFound) {
        NSLog(@"%@ doesn't appear in %@", finalString, self);
        return nil;
    }
    
    if (remainText) {
        targetRange.location = startRange.location;
        targetRange.length = endRange.location + endRange.length - targetRange.location;
    }
    else {
        targetRange.length = endRange.location - targetRange.location;
    }
    
    NSString *text = [stringAux substringWithRange:targetRange];
    
    // We've already checked that at least we have one occurence of initialString and finalString
    do {
        [resultArray addObject:text];
        
        // Delete the range analyzed
        
        NSRange toDeleteRange;
        toDeleteRange.location = 0;
        toDeleteRange.length = endRange.location + endRange.length;
        [stringAux deleteCharactersInRange:toDeleteRange];
        
        startRange = [stringAux rangeOfString:initialString];
        
        if (startRange.location == NSNotFound) {
            text = nil;
        }
        else
        {
            targetRange.location = startRange.location + startRange.length;
            targetRange.length = [stringAux length] - targetRange.location;
            endRange = [stringAux rangeOfString:finalString options:0 range:targetRange];
            if (endRange.location == NSNotFound) {
                text = nil;
            } else {
                if (remainText) {
                    targetRange.location = startRange.location;
                    targetRange.length = endRange.location + endRange.length - targetRange.location;
                } else {
                    targetRange.length = endRange.location - targetRange.location;
                    
                }
                text = [stringAux substringWithRange:targetRange];
            }
        }
        
    } while (text != nil);
    
    NSArray *textosFinal = [NSArray arrayWithArray:resultArray];
    
    return textosFinal;
}

@end
