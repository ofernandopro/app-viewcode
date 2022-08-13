//
//  ViewController.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 11/08/22.
//

import UIKit

class LoginVC: UIViewController {

    var loginSreen: LoginScreen?
    
    override func loadView() {
        self.loginSreen = LoginScreen()
        self.view = self.loginSreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginSreen?.delegate(delegate: self)
        self.loginSreen?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
        print("Login Button")
    }
    
    func actionRegisterButton() {
        print("Register Button")
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        self.loginSreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
}

