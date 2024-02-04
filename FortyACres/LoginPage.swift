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
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard

                userDefaults.set("defaultpwd", forKey: "WiCS")
                let username = usernameField.text ?? ""
                let password = passwordField.text
                if let storedPassword = userDefaults.string(forKey: username) {
                    if password == storedPassword {
                        self.performSegue(withIdentifier: loginSegue, sender: nil)
                    } else {
                        shake(object: passwordField)
                    }
                } else {
                    shake(object: usernameField)
                    shake(object: passwordField)
                }
    }
    
    @IBAction func orgButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard

                userDefaults.set("defaultpwd", forKey: "WiCS")

                

                let username = usernameField.text ?? ""

                let password = passwordField.text

                if let storedPassword = userDefaults.string(forKey: username) {

                    if password == storedPassword {

                        self.performSegue(withIdentifier: orgSegue, sender: nil)

                    } else {

                        shake(object: passwordField)

                    }

                } else {

                    shake(object: usernameField)

                    shake(object: passwordField)

                }
    }
    
    func shake(object: UITextField)

        {

            object.text = ""

            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")

            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

            animation.duration = 0.5

            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]

            object.layer.add(animation, forKey: "shake")

        }
}
