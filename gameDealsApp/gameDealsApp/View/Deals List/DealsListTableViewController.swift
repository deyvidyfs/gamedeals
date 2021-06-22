//
//  DealsListTableViewController.swift
//  gameDealsApp
//
//  Created by Deyvidy Luã F.S on 21/06/21.
//

import UIKit

class DealsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DealBusiness.init().fetchDealsSummary(platform: "Xbox", completionHandler: { deals in
            print(deals)
        })
        
    }


}


