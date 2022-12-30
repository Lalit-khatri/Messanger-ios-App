//
//  ViewController.swift
//  Chat_App
//
//  Created by Lalit kumar on 29/12/22.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        let isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "user_login")
      
        if !isLoggedIn {
            let vc  = LoginViewController()
            let navVc = UINavigationController(rootViewController: vc)
            navVc.modalPresentationStyle = .fullScreen
            present(navVc, animated: true, completion: nil)
        }
    }

}

