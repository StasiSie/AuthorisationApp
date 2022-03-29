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
        view.endEditing(true)
    }

    @IBAction func passwordAlert() {
        setAlert(header: "Forgot password?", body: "Here's your password: 12345")
    }
    
    @IBAction func usernameAlert() {
        setAlert(header: "Forgot username?", body: "Here's your username: qwerty")
    }
    
    
    
    @IBAction func loggingIn() {
        if usernameTextField.text != login || passwordTextField.text != password {
            setAlert(header: "Incorrect user info", body: "Check if your username or password is correct")
    }
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
            return true
        } else {
            loggingIn()
            performSegue(withIdentifier: "LogginIn", sender: loginButton)
            return true
        }
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    private func setAlert(header: String, body: String) {
        let alert = UIAlertController(title: header,
                                      message: body,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(action) -> Void in
            print("The user is not okay.")}))
        self.present(alert, animated: true, completion: nil)
    }
}

