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
        
        let loginController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        loginController?.loginSuccess = {
            self.dismiss(animated: true) {
            // TODO: Load data from ViewModel
          }
        }
        self.present(loginController ?? UIViewController(), animated: true, completion: nil)
    }


}

