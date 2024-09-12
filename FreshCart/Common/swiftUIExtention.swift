//
//  swiftUIExtention.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/8/24.
//

import Foundation

extension String{
    
    func isValidEmail() -> Bool {
            // Regular expression pattern for validating an email address
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            // Create an NSPredicate with the regular expression
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            
            // Evaluate the string against the regular expression
            return emailTest.evaluate(with: self)
        }
}
