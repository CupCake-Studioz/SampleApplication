//
//  LoginRepoFactory.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class LoginRepoFactory {
    
    static func getRepository(email : String , password : String) -> LoginRepository {
        
        return LoginAPIRepository.init(email, password: password)
    }
}
