//
//  ValidationResult.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class ValidationResult {
    
    var status : Bool
    var errorMessage : String?
    
    init(status : Bool, errorMessage : String?) {
        self.status = status
        self.errorMessage = errorMessage
    }
}
