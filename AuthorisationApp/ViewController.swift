//
//  ViewController.swift
//  AuthorisationApp
//
//  Created by Игорь Богданов on 24.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func passwordAlert() {
        let alert = UIAlertController(title: "Forfot password?",
                                      message: "Here's your password: 12345",
                                      preferredStyle: .alert)
        self.present(alert, animated: true)
    }
    
}

