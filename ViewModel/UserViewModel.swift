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
    
    private let minUsernameLength = 4
    private let minPasswordLength = 5
    
    private var user = User()
    private var loginRepository : LoginRepository?
    
    lazy private var usernameValidation : Validator = Validator.init([UsernameEmptyValidation(),UsernameMinimumLengthValidation(minUsernameLength)])
    lazy private var passwordValidation :Validator = Validator.init([PasswordEmptyValidation(),PasswordMinimumLengthValidation(minPasswordLength)])
    
    var username: String {
        return user.username
    }
    
    var password: String {
        return user.password
    }
    
}

extension UserViewModel {
    func updateUsername(username: String) {
        user.username = username
    }
    
    func updatePassword(password: String) {
        user.password = password
    }
    
    func validate() -> UserValidationState {
        
        let usernameValidationResult = usernameValidation.validate(input: user.username)
        
        if !usernameValidationResult.status  {
            return .Invalid(usernameValidationResult.errorMessage ?? "")
        }
        
        let passwordValidationResult = passwordValidation.validate(input: user.password)
        
        if !passwordValidationResult.status  {
            return .Invalid(passwordValidationResult.errorMessage ?? "")
        }
        
        return .Valid
    }
    
    func login( completion: @escaping  (_ errorString: String?) -> Void) {
        
        LoginRepoFactory.getRepository(username: self.user.username, password: self.user.password).fetch { success, error in
            
            if success {
                completion(nil)
            }else{
                completion(error)
            }
        }
    }
}
