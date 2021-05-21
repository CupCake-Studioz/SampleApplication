//
//  Validator.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class Validator {
    
    private var validations : [Validation]
    
    init(_ validations: [Validation]) {
        self.validations = validations
    }
    
    func validate(input : String)  -> ValidationResult  {
        
        for validation in validations {
            let result = validation.validate(input: input)
            
            if !result.status {
                return result
            }
        }
        return ValidationResult.init(status: true, errorMessage: nil)
    }
}
