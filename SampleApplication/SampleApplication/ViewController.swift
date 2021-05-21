//
//  ViewController.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 20/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        let loginController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController")
//        self.present(loginController, animated: true, completion: nil)
        
        let dashboardController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "DashboardViewController")
        
        self.present(dashboardController, animated: true, completion: nil)
    }
    
    
}

