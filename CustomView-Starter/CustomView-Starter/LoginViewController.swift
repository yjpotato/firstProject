//
//  ViewController.swift
//  CustomView-Starter
//
//  Created by 정유진 on 2022/08/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginLabel = UILabel()
    let idInputView = InputView(type: .id)

    let passwordInputView = InputView(type: .password)
    
    let loginButton = UIButton(type: .system)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.text = "로그인"
        loginLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
       
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 4
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitle( .white, for: .normal)
        loginButton.layer.cornerRadius = 4
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
        
        
    
        view.addSubview(loginLabel)
        view.addSubview(idInputView)
     
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
            
            idInputView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
            idInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordInputView.topAnchor.constraint(equalTo: idInputView, constant: 12),
            
            loginButton.topAnchor.constraint(equalTo: passwordInputView.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 68)
            
        
        ])
    }
    
    @objc
    func didTapLoginButton(_ sender: UIButton) {
        guard  let id = idInputView.text,
               let password = passwordInputView.text else {return}
            
        LoginManager().check(id: id, password: password) ? login() :presentAlercontroller()
        
    
        }
    func login() {
        present(HomeViewController(), animated: true)
    }
    func presentAlercontroller() {
        
                let alertController = UIAlertController(title: "로그인실패", message: "아이디 혹은 비밀번호를 확인하세요", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "확인", style: .default)
                alertController.addAction(confirmAction)
                present(alertController, animated: true)
        }
    }




