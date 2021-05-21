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
        if user.username.isEmpty || user.password.isEmpty {
            return .Invalid("Username and password are required.")
        }
        
        if user.username.count < minUsernameLength {
            return .Invalid("Username needs to be at least \(minUsernameLength) characters long.")
        }
        
        if user.password.count < minPasswordLength {
            return .Invalid("Password needs to be at least \(minPasswordLength) characters long.")
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
