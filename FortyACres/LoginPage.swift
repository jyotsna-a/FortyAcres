//
//  LoginPage.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/3/24.
//

import UIKit

class LoginPage: UIViewController {
    
    var loginSegue = "loginSegue"
    var orgSegue = "orgSegue"
    
    @IBAction func loginButton(_ sender: Any) {
        self.performSegue(withIdentifier: loginSegue, sender: nil)
    }
    
    @IBAction func orgButton(_ sender: Any) {
        self.performSegue(withIdentifier: orgSegue, sender: nil)
    }
}
