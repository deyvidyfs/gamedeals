//
//  DealsListTableViewController.swift
//  gameDealsApp
//
//  Created by Deyvidy Luã F.S on 21/06/21.
//

import UIKit

class DealsListTableViewController: UITableViewController {
    
    var placeholderCells: [String] = ["A", "B", "C"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DealBusiness.init().fetchDealsSummary(platform: "Xbox", completionHandler: { deals in
            print(deals)
        })
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholderCells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dealsListCell", for: indexPath)
        
        cell.textLabel?.text = "\(placeholderCells[indexPath.row])"
        
        return cell
    }
}


 
