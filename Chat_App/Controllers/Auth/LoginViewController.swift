//
//  LoginViewController.swift
//  Chat_App
//
//  Created by Lalit kumar on 29/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var logoImageView: UIImageView!
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        view.backgroundColor = .systemBackground
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setUpViews(){
        // register Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        // Scroll View
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        view.addSubview(scrollView)
        self.scrollView = scrollView
        
        // Logo image view
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.clipsToBounds = true
        logoImageView.contentMode = .scaleAspectFit
        scrollView.addSubview(logoImageView)
        self.logoImageView = logoImageView
        
        // Email address TextField
        let emailTextField = UITextField()
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholder = "Email Address ....."
        emailTextField.returnKeyType = .continue
        emailTextField.backgroundColor = .white
        emailTextField.layer.cornerRadius = 12
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailTextField.leftViewMode = .always
        emailTextField.keyboardType = .emailAddress
        emailTextField.becomeFirstResponder()
        scrollView.addSubview(emailTextField)
        self.emailTextField = emailTextField
        
        // Password TextField
        let passwordTextField = UITextField()
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.contentMode = .scaleAspectFit
        passwordTextField.placeholder = "Password ....."
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.layer.borderWidth = 1
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        scrollView.addSubview(passwordTextField)
        self.passwordTextField = passwordTextField
        
        // submit Button
        
        let submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.contentMode = .scaleAspectFit
        submitButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        submitButton.titleLabel?.textAlignment = .center
        submitButton.titleLabel?.textColor = .white
        submitButton.backgroundColor = .link
        submitButton.layer.cornerRadius = 12
        submitButton.layer.masksToBounds = true
        submitButton.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
        scrollView.addSubview(submitButton)
        self.submitButton = submitButton
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        logoImageView?.frame =  CGRect(x: (scrollView.width-size)/2 , y: 20, width: size, height: size)
        
        emailTextField.frame = CGRect(x: 30 , y: logoImageView.bottom + 10, width: scrollView.width - 60, height: 52)
        passwordTextField.frame = CGRect(x: 30 , y: emailTextField.bottom + 10, width: scrollView.width - 60, height: 52)
        submitButton.frame = CGRect(x: 30 , y: passwordTextField.bottom + 10, width: scrollView.width - 60, height: 52)
    }
     
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func didTapSubmit() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !password.isEmpty,!email.isEmpty,password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
        //TODO :- Firebase database login
    }
    
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops",
                                      message: "please enter all information to log in ",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel,
                                      handler: nil))
       present(alert, animated: true)
    }
    
     
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         
        if textField  == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            didTapSubmit()
        }
        
        return true
    }
}
