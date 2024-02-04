//
//  StudentFoodPage.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/3/24.
//

import UIKit

class FoodItem {
    var name: String
    var price: String
    
    
    init(name: String, price: String) {
        self.name = name
        self.price = price
    }
}

class Vendor {
    
    var name: String
    var menu: [FoodItem]
    
    
    init(name: String, menu: [FoodItem]) {
        self.name = name
        self.menu = menu
    }
}

class StudentFoodPage: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var MenuTable: UITableView!
    @IBOutlet weak var VendorPicker: UIPickerView!
    
        var vendors: [Vendor] = [
            Vendor(name: "Sabor", menu: [FoodItem(name: "Tacos", price: "$5.97"), FoodItem(name: "Burritos", price: "$9.97"), FoodItem(name: "Bowls", price: "$9.97")]),
            Vendor(name: "Chick-Fil-A", menu: [FoodItem(name: "Sandwiches", price: "$8.99"), FoodItem(name: "Salads", price: "$9.99"), FoodItem(name: "Sides", price: "$5.49")]),
            Vendor(name: "Up and Atom", menu: [FoodItem(name: "Lattes", price: "$5.99"), FoodItem(name: "Coffee", price: "$3.99"), FoodItem(name: "Pastries", price: "$6.49")]),
            Vendor(name: "Jester Java", menu: [FoodItem(name: "Frappuccinos", price: "$6.50"), FoodItem(name: "Lattes", price: "$5.50"), FoodItem(name: "Acai", price: "$4.50")])
        ]
    
        var selectedVendor: Vendor?
        var selectedMenuItems: [FoodItem] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            
            VendorPicker.delegate = self
            VendorPicker.dataSource = self
            
            MenuTable.delegate = self
            MenuTable.dataSource = self
            selectedVendor = vendors.first
            selectedMenuItems = vendors.first?.menu ?? []
            view.addSubview(MenuTable)
            MenuTable.register(UITableViewCell.self, forCellReuseIdentifier: "RightDetailCell")
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
            selectedMenuItems = vendors[row].menu
            DispatchQueue.main.async{
                self.MenuTable.reloadData()
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedMenuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "RightDetailCell"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
            }
            let menuItem = selectedMenuItems[indexPath.row]
            cell?.textLabel?.text = menuItem.name
            cell?.detailTextLabel?.text = menuItem.price
            return cell!
    }
}
