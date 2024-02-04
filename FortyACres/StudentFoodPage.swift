//
//  StudentFoodPage.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/3/24.
//

import UIKit

class Vendor {
    var name: String
    var menu: [String]
    
    init(name: String, menu: [String]) {
        self.name = name
        self.menu = menu
    }
}

class StudentFoodPage: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var MenuPicker: UIPickerView!
    @IBOutlet weak var VendorPicker: UIPickerView!
    
        var vendors: [Vendor] = [
            Vendor(name: "Sabor", menu: ["Tacos", "Bowls", "Burritos"]),
            Vendor(name: "Chick-Fil-A", menu: ["Sandwiches", "Salads"]),
            Vendor(name: "Up and Atom", menu: ["Coffee", "Lattes", "Teas", "Pastries"]),
            Vendor(name: "Jester Java", menu: ["Frappuccinos", "Lattes", "Egg Bites", "Acai"])
        ]
    
        var selectedVendor: Vendor?
        var selectedMenuItems: [String] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            
            VendorPicker.delegate = self
            VendorPicker.dataSource = self
            
            MenuPicker.delegate = self
            MenuPicker.dataSource = self
            selectedVendor = vendors.first
            selectedMenuItems = vendors.first?.menu ?? []
        }
        
        // MARK: - UIPickerViewDataSource Methods
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView ==  VendorPicker {
                        return vendors.count
                    } else if pickerView == MenuPicker {
                        return selectedMenuItems.count
                    }
                    return 0        }
        
        // MARK: - UIPickerViewDelegate Methods
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView == VendorPicker {
                        return vendors[row].name
                    } else if pickerView == MenuPicker {
                        return selectedMenuItems[row]
                    }
                    return nil
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == VendorPicker {
                        // Update the menu picker view with the selected vendor's menu
                        selectedMenuItems = vendors[row].menu
                        MenuPicker.reloadAllComponents()
                    }
        }
}
