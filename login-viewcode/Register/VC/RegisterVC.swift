//
//  RegisterViewController.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 12/08/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    var firestore: Firestore?
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
        self.firestore = Firestore.firestore()
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
                
                // Salvar dados no firebase
                if let idUsuario = result?.user.uid {
                    self.firestore?.collection("usuarios").document(idUsuario).setData([
                        "nome": self.registerScreen?.getName() ?? "",
                        "email": self.registerScreen?.getEmail() ?? "",
                        "id": idUsuario
                    ])
                }
                
                self.alert?.getAlert(title: "Tudo Certo!", message: "Sucesso ao cadastrar", completion: {
                    self.navigationController?.popViewController(animated: true) // Voltar pra tela anterior quando o usuário clicar em Ok
                })
            }
            
        })
    }

}
