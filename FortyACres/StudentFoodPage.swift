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
    
    @IBOutlet weak var VendorPicker: UIPickerView!
    var vendors: [Vendor] = [
            Vendor(name: "Sabor", menu: ["Tacos", "Bowls", "Burritos"]),
            Vendor(name: "Chick-Fil-A", menu: ["Sandwiches", "Salads"])
            
        ]
    
        var selectedVendor: Vendor?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            VendorPicker.delegate = self
            VendorPicker.dataSource = self
            selectedVendor = vendors.first
        }
        
        // MARK: - UIPickerViewDataSource Methods
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return vendors.count
        }
        
        // MARK: - UIPickerViewDelegate Methods
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return vendors[row].name
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedVendor = vendors[row]
        }
        
        
        @IBOutlet weak var MenuLabel: UILabel!
    
    
    @IBAction func MenuButton(_ sender: UIButton) {
        if let selectedVendor = selectedVendor {
            // Join the menu items into a single string with line breaks or any separator you prefer.
            let menuString = selectedVendor.menu.joined(separator: "\n\n")
            MenuLabel.text = "\(menuString)"
        } else {
            // Optional: Handle the case where no vendor is selected or the menu is empty.
            MenuLabel.text = "Please select a vendor."
        }
    }
}
