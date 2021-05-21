//
//  UsernameRegexValidation.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class EmailRegexValidation: Validation {
    
    func validate(input: String?) -> ValidationResult {
        
        if let input_ = input?.trimmingCharacters(in: .whitespaces), input_.count > 0,input_.isValidEmail() {
            
            return ValidationResult(status: true, errorMessage: nil)
        }
        
        return ValidationResult(status: false, errorMessage:"Please enter valid email Address")
    }
    
}
