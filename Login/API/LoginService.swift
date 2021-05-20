//
//  LoginService.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 20/05/21.
//

import Foundation

struct LoginService {
   
    static var isAuthenticated = false
    
    static func loginWithUsername(username: String, password: String, completion: (Bool) -> Void) {
        if username == "shubham" && password == "shukla" {
            isAuthenticated = true
            completion(true)
        } else {
            completion(false)
        }
    }
    
    static func logout(completion: () -> Void) {
        isAuthenticated = false
        completion()
    }
}
