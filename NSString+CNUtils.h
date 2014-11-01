//
//  NSString+CNUtils.h
//  
//
//  Created by Carlos Nuñez on 16/10/14.
//
//



@interface NSString (CNUtils)

/**
 *  Checks if the receiver is a valid number
 *
 *  @return YES if the receiver is a valid number. NO otherwise
 */

- (BOOL)isNumber;

/**
 *  Checks if the receiver is a valid email. Taken from http://stackoverflow.com/questions/3139619/check-that-an-email-address-is-valid-on-ios
 *
 *  @return YES if the receiver is a valid email. NO otherwise
 */

- (BOOL)isValidEmail;

/**
 *  Checks if the receiver is a valid phone number. Taken from http://stackoverflow.com/questions/11433364/nstextcheckingresult-for-phone-numbers
 *
 *  @return YES if the receiver is a valid phone number. NO otherwise
 */

- (BOOL)isValidPhoneNumber;

/**
 *  Checks if the receiver contains subString
 *
 *  @param subString string which we look for in the receiver
 *
 *  @return YES is subString appears in the receiver. NO otherwise
 */

- (BOOL)contains:(NSString *)subString;

// Dada una cadena de texto, una cadena de texto inicial y otra de texto final. Nos devuelve un array que contiene el texto contenido
// entre las cadenas inicial y final. El array tendrá tantos elementos como apariciones de cadena inicial y final

/**
 *  Returns an array containing substrings from the receiver that have been divided by initialString and finalString.
    If initialString or finalString are nil or some of them doesn't appear in the receiver returns nil.
 *
 *  @param initialString the initial separator string
 *  @param finalString   the final separator string
 *  @param remainsText   YES if the components must include initialString and finalString. NO otherwise
 *
 *  @return an array containing substrings from the receiver that have been divided by initialString and finalString
 */


- (NSArray *)componentsBetweenString:(NSString*) initialString andString:(NSString*) finalString remainTexts:(BOOL)remainsText;



@end
