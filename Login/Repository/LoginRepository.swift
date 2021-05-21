//
//  LoginRepository.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import Foundation

typealias LoginHandler = (_ response : Bool,_ error: String?) -> Void

protocol LoginRepository {
    
    func fetch(completion : @escaping LoginHandler)
   
}
