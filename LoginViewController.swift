//
//  LoginViewController.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 20/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfUsernameOutlet: UITextField!
    @IBOutlet weak var tfPasswordOutlet: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var viewModel = UserViewModel()
    
    var loginSuccess: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btLoginAction(_ sender: Any) {
        
        dismissKeyboard()
        authenticate()
        
    }
    
    func authenticate(){
        
        self.activityIndicator.startAnimating()
        
        switch viewModel.validate() {
        case .Valid:
            viewModel.login() { errorMessage in
                if let errorMessage = errorMessage {
                    self.displayErrorMessage(errorMessage: errorMessage)
                } else {
                    self.loginSuccess?()
                }
                self.activityIndicator.stopAnimating()
            }
        case .Invalid(let error):
            displayErrorMessage(errorMessage: error)
            
            self.activityIndicator.stopAnimating()

        }
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


// MARK: UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfUsernameOutlet {
            textField.text = viewModel.username
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == tfUsernameOutlet {
            textField.text = viewModel.protectedUsername
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfUsernameOutlet {
            tfUsernameOutlet.becomeFirstResponder()
        } else {
            authenticate()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if textField == tfUsernameOutlet {
            viewModel.updateUsername(username: newString)
        } else if textField == tfPasswordOutlet {
            viewModel.updatePassword(password: newString)
        }
        
        return true
    }
}





// MARK: Private Methods
private extension LoginViewController {
 
    func displayErrorMessage(errorMessage: String) {
        let alertController = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
