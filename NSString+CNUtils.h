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



@end
