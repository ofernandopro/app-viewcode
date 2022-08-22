//
//  RegisterViewController.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 12/08/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        self.registerUser()
    }
    
    func registerUser() {
        guard let register = self.registerScreen else { return }
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar")
            } else {
                self.alert?.getAlert(title: "Tudo Certo!", message: "Sucesso ao cadastrar", completion: {
                    self.navigationController?.popViewController(animated: true) // Voltar pra tela anterior quando o usuário clicar em Ok
                })
            }
            
        })
    }

}
