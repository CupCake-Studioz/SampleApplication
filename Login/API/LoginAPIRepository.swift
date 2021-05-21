//
//  LoginAPIRepository.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class LoginAPIRepository : LoginRepository {
    
    var username : String
    var password : String
    
    init(_ username : String, password : String) {
        
        self.username = username
        self.password = password
    }
    
    func fetch(completion: @escaping LoginHandler) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            if self.username.caseInsensitiveCompare("shubham") == .orderedSame && self.password.caseInsensitiveCompare("shukla") == .orderedSame {
                completion(true, nil)
            } else {
                completion(false, "Login failed")
            }
        }
    }
    
    
}


