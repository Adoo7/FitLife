//
//  CategoryTableViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 30/12/2022.
//

import UIKit
struct Category {
    let title: String
    let image: String
//    let workouts: [Workout]
}

class CategoryTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cat: Category?
    var checkIfEdit = false
    
    var indexOfCategory = 0
    
    var list: [Category] = [
        Category(title: "Bodybuilding", image: "Bodybuilding_Image"),
        Category(title: "Crossfit", image: "Crossfit_Image"),
        Category(title: "HIIT", image: "HIIT_Image"),
        Category(title: "Yoga", image: "Yoga_Image")
    ]
   
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryTable.dataSource = self
        categoryTable.delegate = self
        update()
    }

    // MARK: - Table view data source

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return list.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let data = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell

        // Configure the cell...
         cell.label1.text = data.title
         cell.iconImage1.image = UIImage(named: data.image)

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            print("edit")
            self.indexOfCategory = indexPath.row
            self.checkIfEdit = true
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCategoryViewController") as! AddCategoryViewController
            vc.category = self.list[indexPath.row]
            self.present(vc, animated: true)
            completionHandler(true)
            
        }
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            print("delete")
            self.list.remove(at: indexPath.row)
            tableView.reloadData()
            completionHandler(true)
        }
        
        delete.backgroundColor = .red
        
        let swipe = UISwipeActionsConfiguration(actions: [edit, delete])
        return swipe
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cat = list[indexPath.row]
        print("selected row \(indexPath.row)")
        
    }
    func update(){
        categoryTable.reloadData()
        print("updated data, rows: \(list.count)")
    }
    @IBAction func unwindToCategoryList(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? AddCategoryViewController
        // Use data from the view controller which initiated the unwind segue
        if let category = sourceViewController?.category {
            if checkIfEdit == false {
                print("edit is false")
                list.append(category)
                print("added to array")
            } else {
                print("edit is true")
                list[indexOfCategory] = category
                print("item has been replaced")
                checkIfEdit = false
            }
            print("added to array")
        } else {
            print("operation cancelled")
        }
        
        update()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let vc = segue.destination as? ItemDetailViewController
        
        if segue.identifier == "viewItem" {
            
            let vc = segue.destination as? AddCategoryViewController
            vc?.category = cat
            
        } else if segue.identifier == "editItem"{
            
            let vc = segue.destination as? AddCategoryViewController
            vc?.category = cat
            
        }
        
    }
}


