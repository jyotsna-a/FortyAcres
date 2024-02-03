//
//  LoginPage.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/3/24.
//

import UIKit

class LoginPage: UIViewController {
    
    var loginSegue = "loginSegue"
    
    @IBAction func loginButton(_ sender: Any) {
        self.performSegue(withIdentifier: loginSegue, sender: nil)
    }
    
}
