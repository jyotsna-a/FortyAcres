//
//  StudentTransactions.swift
//  FortyACres
//
//  Created by Jyotsna Arunkumar on 2/3/24.
//

import UIKit

class StudentTransactions: UIViewController, UITableViewDataSource, UITableViewDelegate {
    struct Transaction {
        let name: String
        let date: String
    }
        
        @IBOutlet weak var TranTable: UITableView!
        
        
        let transactions: [Transaction] = [
            Transaction(name: "Sabor Tacos y Mas", date: "2/1/24"),
            Transaction(name: "Up and Atom", date: "1/29/24"),
            Transaction(name: "Chick-Fil-A", date: "1/26/24"),
            Transaction(name: "Jester Java", date: "1/20/24"),
            Transaction(name: "Up and Atom", date: "1/19/24")
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
                
                var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
                
            if cell == nil {
                    cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
                }
                
                // Configure the cell
                let transaction = transactions[indexPath.row]
                cell?.textLabel?.text = transaction.name
                cell?.detailTextLabel?.text = transaction.date
                
                return cell!
        }
    }
