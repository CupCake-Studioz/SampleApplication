//
//  UsernameMinimumLengthValidation.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class EmailMinimumLengthValidation: Validation {

    let minimumLength : Int?
    
    init(_ MinimumLength: Any) {
        self.minimumLength = MinimumLength as? Int
    }
    
    func validate(input: String?) -> ValidationResult {
        
        if let input_ = input, let minimumLength_ = minimumLength, input_.count >= minimumLength_ {
            
            return ValidationResult(status: true, errorMessage: nil)
        }
        
        return ValidationResult(status: false, errorMessage:"Email needs to be at least \(self.minimumLength ?? 5) characters long.")
    }
    
}
