//
//  CategoryTableViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 30/12/2022.
//

import UIKit

class CategoryTableViewController: UIViewController, UITableViewDataSource {
    
    struct Category {
        let title: String
        let image: String
    }
    
    let list: [Category] = [
        Category(title: "Bodybuilding", image: "Bodybuilding"),
        Category(title: "Crossfit", image: "Crossfit"),
        Category(title: "HIIT", image: "HITT"),
        Category(title: "Yoga", image: "Yoga")
        
    ]
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryTable.dataSource = self
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return list.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

}

