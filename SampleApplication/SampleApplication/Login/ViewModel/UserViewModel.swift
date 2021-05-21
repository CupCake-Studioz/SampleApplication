//
//  UserViewModel.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 20/05/21.
//

import Foundation

enum UserValidationState {
    case Valid
    case Invalid(String)
}

class UserViewModel {
    
    private let minEmailLength = 3
    private let minPasswordLength = 5
    
    private var user = User()
    
    lazy private var emailValidation : Validator = Validator.init([EmailEmptyValidation(),EmailMinimumLengthValidation(minEmailLength),EmailRegexValidation()])
    lazy private var passwordValidation :Validator = Validator.init([PasswordEmptyValidation(),PasswordMinimumLengthValidation(minPasswordLength)])
    
    var email: String {
        return user.email
    }
    
    var password: String {
        return user.password
    }
    
}

extension UserViewModel {
    func updateEmail(email: String) {
        user.email = email
    }
    
    func updatePassword(password: String) {
        user.password = password
    }
    
    func validate() -> UserValidationState {
        
        let emailValidationResult = emailValidation.validate(input: user.email)
        
        if !emailValidationResult.status  {
            return .Invalid(emailValidationResult.errorMessage ?? "")
        }
        
        let passwordValidationResult = passwordValidation.validate(input: user.password)
        
        if !passwordValidationResult.status  {
            return .Invalid(passwordValidationResult.errorMessage ?? "")
        }
        
        return .Valid
    }
    
    func login( completion: @escaping  (_ errorString: String?) -> Void) {
        
        LoginRepoFactory.getRepository(email: self.user.email, password: self.user.password).fetch { success, error in
            
            if success {
                completion(nil)
            }else{
                completion(error)
            }
        }
    }
}
