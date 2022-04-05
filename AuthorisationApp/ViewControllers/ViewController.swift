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
    
    private let userInfo = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTextField.delegate = self
        self.usernameTextField.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        for viewController in viewControllers {
            if let loggedInVC = viewController as? LoggedInViewController {
                loggedInVC.user = userInfo.person.fullName
            } else if let aboutVC = viewController as? AboutViewController {
                aboutVC.fullName = userInfo.person.fullName
                aboutVC.university = userInfo.person.education
                aboutVC.age = userInfo.person.age
            } else if let hobbieVC = viewController as? HobbiesViewController {
                hobbieVC.hobbie1 = userInfo.person.hobbie1
                hobbieVC.hobbie2 = userInfo.person.hobbie2
            }
            
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func passwordAlert() {
        setAlert(header: "Forgot password?", body: "Here's your password: \(userInfo.password)")
    }
    
    @IBAction func usernameAlert() {
        setAlert(header: "Forgot username?", body: "Here's your username: \(userInfo.login)")
    }
    
    
    
    @IBAction func loggingIn() {
        if usernameTextField.text != userInfo.login || passwordTextField.text != userInfo.password {
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

