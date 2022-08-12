//
//  ViewController.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 11/08/22.
//

import UIKit

class ViewController: UIViewController {

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

extension ViewController: LoginScreenProtocol {
    
    func actionLoginButton() {
        print("Login Button")
    }
    
    func actionRegisterButton() {
        print("Register Button")
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
}

