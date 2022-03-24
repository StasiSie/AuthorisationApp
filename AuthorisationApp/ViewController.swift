//
//  ViewController.swift
//  AuthorisationApp
//
//  Created by Игорь Богданов on 24.03.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    private let login = "qwerty"
    private let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTextField.delegate = self
        self.usernameTextField.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loggedInVC = segue.destination as? LoggedInViewController else {return}
        loggedInVC.user = login
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super .touchesBegan(touches, with: event)
    }

    @IBAction func passwordAlert() {
        let alert = UIAlertController(title: "Forgot password?",
                                      message: "Here's your password: 12345",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(action) -> Void in
            print("The user is not okay.")}))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func usernameAlert() {
        let alert = UIAlertController(title: "Forgot username?",
                                      message: "Here's your username: qwerty",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(action) -> Void in
            print("The user is not okay.")}))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func loggingIn() {
        if usernameTextField.text != login || passwordTextField.text != password {
            let alert = UIAlertController(title: "Incorrect user info",
                                          message: "Check if your login or password is correct",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(action) -> Void in
                print("The user is not okay.")}))
            self.present(alert, animated: true, completion: nil)
    }
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
            return true
        } else {
            return false
        }
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
  

    }

