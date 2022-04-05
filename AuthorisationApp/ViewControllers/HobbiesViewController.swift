//
//  HobbiesViewController.swift
//  AuthorisationApp
//
//  Created by Игорь Богданов on 05.04.2022.
//

import UIKit

class HobbiesViewController: UIViewController {

    @IBOutlet var hobbiesLabel: UILabel!
    
    
    var hobbie1 = ""
    var hobbie2 = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        hobbiesLabel.text = "На данный момент мои основные хобби это: \(hobbie1) и \(hobbie2)."
        
        
    }
    

    

}
