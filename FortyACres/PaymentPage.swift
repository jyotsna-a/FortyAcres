//
//  PaymentPage.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/4/24.
//

import UIKit

class PaymentPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    struct Transaction {
        let name: String
        let price: String // Ideally, use Date and DateFormatter for formatting
    }
        
        
    @IBOutlet weak var TranTable: UITableView!
    
        let transactions: [Transaction] = [
            Transaction(name: "Veggie Taco", price: "$5.97"),
        ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        TranTable.delegate = self
        TranTable.dataSource = self
        view.addSubview(TranTable)
        TranTable.register(UITableViewCell.self, forCellReuseIdentifier: "RightCellDetail")
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return transactions.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let identifier = "RightDetailCell"
                
                // Try to dequeue a reusable cell
                var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
                
                // If no reusable cell is available, initialize a new cell with the right detail style
                if cell == nil {
                    cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
                }
                
                // Configure the cell
                let transaction = transactions[indexPath.row]
                cell?.textLabel?.text = transaction.name
                cell?.detailTextLabel?.text = transaction.price
                
                return cell!
        }
    
}
