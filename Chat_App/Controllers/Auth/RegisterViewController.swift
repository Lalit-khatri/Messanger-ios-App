//
//  RegisterViewController.swift
//  Chat_App
//
//  Created by Lalit kumar on 29/12/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var logoImageView: UIImageView!
    private var firstNameTextField: UITextField!
    private var lastNameTextField: UITextField!
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "register"
        view.backgroundColor = .systemBackground
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setUpViews(){
        // Scroll View
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
//        scrollView.isScrollEnabled = true
//        scrollView.scrollsToTop = true
        scrollView.isUserInteractionEnabled = true
        view.addSubview(scrollView)
        self.scrollView = scrollView
        
        // Logo image view
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(systemName: "person.circle")
        logoImageView.clipsToBounds = true
        logoImageView.tintColor = .gray
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.layer.masksToBounds = true
        logoImageView.layer.borderWidth = 2
        logoImageView.layer.borderColor = UIColor.lightGray.cgColor
        logoImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapLogoView))
        logoImageView.addGestureRecognizer(gesture)
        scrollView.addSubview(logoImageView)
        self.logoImageView = logoImageView

        // first Name TextField
        let firstNameTextField = UITextField()
        firstNameTextField.autocorrectionType = .no
        firstNameTextField.autocapitalizationType = .none
        firstNameTextField.placeholder = "First Name ....."
        firstNameTextField.returnKeyType = .continue
        firstNameTextField.backgroundColor = .white
        firstNameTextField.layer.cornerRadius = 12
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        firstNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        firstNameTextField.leftViewMode = .always
        firstNameTextField.keyboardType = .emailAddress
        firstNameTextField.becomeFirstResponder()
        scrollView.addSubview(firstNameTextField)
        self.firstNameTextField = firstNameTextField
        
        // Last Name TextField
        let lastNameTextField = UITextField()
        lastNameTextField.autocorrectionType = .no
        lastNameTextField.autocapitalizationType = .none
        lastNameTextField.placeholder = "Last Name ....."
        lastNameTextField.returnKeyType = .continue
        lastNameTextField.backgroundColor = .white
        lastNameTextField.layer.cornerRadius = 12
        lastNameTextField.layer.borderWidth = 1
        lastNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        lastNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        lastNameTextField.leftViewMode = .always
        lastNameTextField.keyboardType = .emailAddress
        lastNameTextField.becomeFirstResponder()
        scrollView.addSubview(lastNameTextField)
        self.lastNameTextField = lastNameTextField
        
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
        submitButton.setTitle("Register", for: .normal)
        submitButton.contentMode = .scaleAspectFit
        submitButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        submitButton.titleLabel?.textAlignment = .center
        submitButton.titleLabel?.textColor = .white
        submitButton.backgroundColor = .systemGreen
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
        logoImageView.layer.cornerRadius = (logoImageView.frame.width)/2
        firstNameTextField.frame = CGRect(x: 30 , y: logoImageView.bottom + 30, width: scrollView.width - 60, height: 52)
        lastNameTextField.frame = CGRect(x: 30 , y: firstNameTextField.bottom + 10, width: scrollView.width - 60, height: 52)
        emailTextField.frame = CGRect(x: 30 , y: lastNameTextField.bottom + 10, width: scrollView.width - 60, height: 52)
        passwordTextField.frame = CGRect(x: 30 , y: emailTextField.bottom + 10, width: scrollView.width - 60, height: 52)
        submitButton.frame = CGRect(x: 30 , y: passwordTextField.bottom + 10, width: scrollView.width - 60, height: 52)
    }
     
    
    @objc private func didTapLogoView() {
        print("logo tapped")
        presentPhotoActionSheet()
    }
    
    @objc private func didTapSubmit() {
        emailTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              !firstName.isEmpty,!lastName.isEmpty,
              !password.isEmpty,!email.isEmpty,password.count >= 6 else {
            alertUserregisterError()
            return
        }
        
        //TODO :- Firebase database register
    }
    
    func alertUserregisterError(){
        let alert = UIAlertController(title: "Woops",
                                      message: "please enter all information to register fields ",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel,
                                      handler: nil))
       present(alert, animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         
        if textField  == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        }
        else if textField == lastNameTextField {
            emailTextField.becomeFirstResponder()
        }
        else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            didTapSubmit()
        }
        
        return true
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    private func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "pic a profile picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take",
                                            style: .default,
                                            handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose",
                                            style: .default,
                                            handler:{ [weak self] _ in
            self?.presentPhotoLibrary()
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .camera
        vc.cameraCaptureMode = .photo
        present(vc, animated: true, completion: nil)
    }
    
    func presentPhotoLibrary() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        logoImageView.image = image
    }
}
