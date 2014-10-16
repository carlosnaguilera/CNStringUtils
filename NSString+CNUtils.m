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


@end
