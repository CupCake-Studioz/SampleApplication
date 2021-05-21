//
//  LSPasswordValidation.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

protocol Validation {
        
    func validate( input: String? ) -> ValidationResult
    
}
