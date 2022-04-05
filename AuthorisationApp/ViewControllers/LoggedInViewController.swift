//
//  LoggedInViewController.swift
//  AuthorisationApp
//
//  Created by Игорь Богданов on 24.03.2022.
//

import UIKit

class LoggedInViewController: UIViewController {

    @IBOutlet var logOutButton: UIButton!
    @IBOutlet var loggedUserLabel: UILabel!
    
    var user = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()

        loggedUserLabel.text = "\(user), you've logged in!"
    }
    
    
    
    
}
