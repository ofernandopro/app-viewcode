//
//  RegisterScreen.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 12/08/22.
//

import UIKit

protocol RegisterScreenProtocol: class {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageUser: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.placeholder = "Digite seu email:"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.isSecureTextEntry = true
        tf.placeholder = "Digite sua senha:"
        return tf
    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.configSuperView()
        
        // Setting up constraints:
        self.configImageUserConstraint()
        self.configBackButtonConstraint()
        self.configEmailTextFieldConstraint()
        self.configPasswordTextFieldConstraint()
        self.configRegisterButtonConstraint()
        
        self.setupConstraints() // Chamar depois de chamar a função de configSuperView!!
    }
    
    private func configSuperView() {
        self.addSubview(self.backButton)
        self.addSubview(self.imageUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        print("Voltar")
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        print("Register")
        self.delegate?.actionRegisterButton()
    }
    
    public func validateTextFields() {
        
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
        
    }
    
    private func configButtonEnable(_ enable: Bool) {
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
//            self.imageUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
//            self.imageUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.imageUser.widthAnchor.constraint(equalToConstant: 150),
//            self.imageUser.heightAnchor.constraint(equalToConstant: 150),
            
            
//            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            
//            self.emailTextField.topAnchor.constraint(equalTo: self.imageUser.bottomAnchor, constant: 40),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
//            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    func configImageUserConstraint() {
        self.imageUser.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
    }
    
    func configBackButtonConstraint() {
        self.backButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configEmailTextFieldConstraint() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.imageUser.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldConstraint() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstraint() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(40)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(50)
        }
    }
    
    
}
