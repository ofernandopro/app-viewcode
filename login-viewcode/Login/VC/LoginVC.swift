//
//  ViewController.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 11/08/22.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    var loginSreen: LoginScreen?
    var auth: Auth?
    
    override func loadView() {
        self.loginSreen = LoginScreen()
        self.view = self.loginSreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginSreen?.delegate(delegate: self)
        self.loginSreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
        self.loginUser()
    }
    
    func loginUser() {
        guard let login = self.loginSreen else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
            
            if error != nil {
                print("Dados incorretos. Tente novamente.")
            } else {
                if user == nil {
                    print("Tivemos um problema inesperado, tente novamente mais tarde.")
                } else {
                    print("Usuário logado com sucesso")
                }
            }
            
        })
    }
    
    func actionRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginSreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
}

