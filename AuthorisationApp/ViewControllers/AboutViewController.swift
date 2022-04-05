//
//  AboutViewController.swift
//  AuthorisationApp
//
//  Created by Игорь Богданов on 05.04.2022.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var aboutLabel: UILabel!
    
    var fullName = ""
    var age = 0
    var university = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutLabel.text = "Привет, меня зовут \(fullName), мне \(age) года, учился я в: \(university) "
    }
    

}
