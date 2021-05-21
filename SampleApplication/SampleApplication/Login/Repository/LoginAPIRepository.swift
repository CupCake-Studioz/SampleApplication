//
//  LoginAPIRepository.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class LoginAPIRepository : LoginRepository {
    
    var email : String
    var password : String
    
    init(_ email : String, password : String) {
        
        self.email = email
        self.password = password
    }
    
    func fetch(completion: @escaping LoginHandler) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            if self.email.caseInsensitiveCompare("s@gmail.com") == .orderedSame && self.password.caseInsensitiveCompare("shukla") == .orderedSame {
                completion(true, nil)
            } else {
                completion(false, "Login failed!! Invalid Credentials")
            }
        }
    }
    
    
}


