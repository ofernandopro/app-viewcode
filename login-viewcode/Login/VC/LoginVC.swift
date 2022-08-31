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
    var alert: Alert?
    
    override func loadView() {
        self.loginSreen = LoginScreen()
        self.view = self.loginSreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginSreen?.delegate(delegate: self)
        self.loginSreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
        
//        let vc: HomeVC = HomeVC()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let login = self.loginSreen else { return }

        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in

            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos. Tente novamente.")
            } else {
                if user == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde.")
                } else {
                    self.alert?.getAlert(title: "Parabéns", message: "Usuário logado com sucesso")
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

