//
//  StudentOrgPage.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/3/24.
//

import UIKit

class Org {
    var name: String
    var menu: [String]
    
    init(name: String, menu: [String]) {
        self.name = name
        self.menu = menu
    }
}

class StudentOrgPage: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var PayPicker: UIPickerView!
    @IBOutlet weak var OrgsPicker: UIPickerView!
    var orgs: [Org] = [
            Org(name: "Texas ISA", menu: ["Spring Dues", "Jeena Ticket", "Jeena After-Party Ticket"]),
            Org(name: "Texas Consulting", menu: ["Spring Dues", "Sweatshirt", "Sticker"]),
            Org(name: "Figure Skating", menu: ["Spring Dues", "Equipment", "Spring Gala"]),
            Org(name: "Alpha Kappa Psi", menu: ["Resume Review", "Spring Event", "Fees"])
        ]
    
        var selectedOrg: Org?
        var selectedMenuItems: [String] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            
            OrgsPicker.delegate = self
            OrgsPicker.dataSource = self
            
            PayPicker.delegate = self
            PayPicker.dataSource = self
            selectedOrg = orgs.first
            selectedMenuItems = orgs.first?.menu ?? []
        }
        
        // MARK: - UIPickerViewDataSource Methods
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView ==  OrgsPicker {
                        return orgs.count
                    } else if pickerView == PayPicker {
                        return selectedMenuItems.count
                    }
                    return 0        }
        
        // MARK: - UIPickerViewDelegate Methods
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView == OrgsPicker {
                        return orgs[row].name
                    } else if pickerView == PayPicker {
                        return selectedMenuItems[row]
                    }
                    return nil
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == OrgsPicker {
                        // Update the menu picker view with the selected vendor's menu
                        selectedMenuItems = orgs[row].menu
                        PayPicker.reloadAllComponents()
                    }
        }
    
    
    @IBAction func payButton(_ sender: Any) {
        self.performSegue(withIdentifier: "pay", sender: nil)
    }
}
