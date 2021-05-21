//
//  LoginRepoFactory.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

class LoginRepoFactory {
    
    static func getRepository(username : String , password : String) -> LoginRepository {
        
        return LoginAPIRepository.init(username, password: password)
    }
}
