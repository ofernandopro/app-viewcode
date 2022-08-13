//
//  RegisterViewController.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 12/08/22.
//

import UIKit

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
    
}

extension RegisterVC: RegisterScreenProtocol {
    
    func actionBackButton() {
        print("Back back")
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        print("Register register")
    }

}
