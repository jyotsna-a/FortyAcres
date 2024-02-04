//
//  OrgPage.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/4/24.
//

import UIKit

class Item {
    var name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class OrgPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuView: UITableView!
    
    var items: [Item] = [Item(name: "Example Name", price: 10.0)] // Example data
        
        override func viewDidLoad() {
            super.viewDidLoad()
            menuView.dataSource = self
            menuView.delegate = self
        }
        
        // DataSource methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let item = items[indexPath.row]
            let priceString = String(format: "$%.2f", item.price)
            cell.textLabel?.text = "\(item.name)    \(priceString)"
            return cell
        }
        
        // Enable editing
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Remove the item from the data array
                items.remove(at: indexPath.row)
                
                // Delete the row from the table view
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    
    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
        // Create an alert controller with a title and message
        let alert = UIAlertController(title: "Add New Item", message: "Enter item name and price", preferredStyle: .alert)
        
        // Add text fields to the alert for the item name and price
        alert.addTextField { (textField) in
            textField.placeholder = "Item name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Price"
            textField.keyboardType = .decimalPad // For price input
        }
        
        // Add a "Cancel" action to the alert
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Add an "Add" action to the alert
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self, weak alert] (_) in
            guard let nameField = alert?.textFields?[0], let priceField = alert?.textFields?[1],
                  let name = nameField.text, !name.isEmpty,
                  let priceText = priceField.text, let price = Double(priceText) else { return }
            
            // Create a new item with the entered name and price
            let newItem = Item(name: name, price: price)
            
            // Append the new item to the items array
            self?.items.append(newItem)
            
            // Insert a new row in the table view
            let insertionIndexPath = IndexPath(row: (self?.items.count ?? 1) - 1, section: 0)
            self?.menuView.insertRows(at: [insertionIndexPath], with: .automatic)
        }))
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
}
