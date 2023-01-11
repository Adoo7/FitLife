
//
//  ItemListViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 29/12/2022.
//

import UIKit

struct Workout:Codable {
    var title:String
    var imageName: String
    var duration: Int
    var description: String
    var difficulty: String
    var pickerIndex: Int = 0
    var picker2Index: Int = 0
}

class ItemListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var workout: Workout?
    var selectedWorkout: Workout?
    var checkIfEdit = false
    var categoryIndex = 0
    var category: Category?
    var allCategories: [Category]?
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var itemTable: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view loaded")
        
        if let categoryPassed = category {
            print("loaded category: \(categoryPassed)")
        }
        
        titleLbl.text = category?.title
        
        // Do any additional setup after loading the view.
        
        //setting up data source and delegate for table view controller
        itemTable.dataSource = self
        itemTable.delegate = self
        
        updateUI()
    }
    
    //1.0 to be able to delete cells
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //1.1
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            category?.workouts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
        
    }
    
    //2.1 adding edit/delete functionality
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            print("edit")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as! AddItemViewController
            vc.workout = self.category?.workouts[indexPath.row]
            vc.indexOfWorkout = indexPath.row
            self.checkIfEdit = true
            self.present(vc, animated: true)
            completionHandler(true)
            
        }
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            print("delete")
            self.category?.workouts.remove(at: indexPath.row)
            tableView.reloadData()
            completionHandler(true)
        }
        
        delete.backgroundColor = .red
        
        let swipe = UISwipeActionsConfiguration(actions: [edit, delete])
        return swipe
        
    }
   
    //giving the amount of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = category?.workouts.count {
            return count
        }
        return 0
    }
    
    //setting the UI of each cell in table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let workout = category?.workouts[indexPath.row]
        let cell = itemTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        if let title = workout?.title, let imageName = workout?.imageName {
            cell.label.text = title
            cell.iconImage.image = UIImage(named: imageName)
        }
        return cell
    }

    
    
    
    //selecting cell function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedWorkout = category?.workouts[indexPath.row]
        print("selected row \(indexPath.row)")
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailView") as! ItemDetailViewController
        vc.workout = category?.workouts[indexPath.row]
        self.present(vc, animated: true)
        
        
    }
    
    // to update the table data for new objects
    func updateUI(){
        itemTable.reloadData()
        print("updated data, rows: \(String(describing: category?.workouts.count))")
    }
    
    @IBAction func unwindToItemList(_ unwindSegue: UIStoryboardSegue) {
        
        let sourceViewController = unwindSegue.source as? AddItemViewController
        
        // Use data from the view controller which initiated the unwind segue
        if let workout = sourceViewController?.workout {
            if checkIfEdit == false {
                print("adding item")
                category?.workouts.append(workout)
                print("added to array")
            } else {
                print("editing item")
                category?.workouts[sourceViewController!.indexOfWorkout] = workout
                print("item has been replaced")
                checkIfEdit = false
            }
        } else {
            print("operation cancelled")
        }
        
        if let currentCategory = category {
            allCategories?[categoryIndex] = currentCategory
        }
        
        if let encoded = try? JSONEncoder().encode(allCategories) {
            UserDefaults.standard.set(encoded, forKey: "allCategories")
        }
        
        updateUI()
    }
    
    //---------------------------REDUNDANT FUNCTION
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        //If user clicks on item in this view, set the detail view controller workout object to the one selected

//        if segue.identifier == "viewItem" {
//
//            let vc = segue.destination as? ItemDetailViewController
//            vc?.workout = selectedWorkout
//
//        } else if segue.identifier == "editItem"{
//
//            let vc = segue.destination as? ItemDetailViewController
//            vc?.workout = selectedWorkout
//
//        } else if segue.identifier == "viewList" {
//
//            let vc = segue.destination as? CategoryTableViewController
//            print("index : \(String(describing: vc?.indexOfCategory))")
//            print("item : \(String(describing: vc?.cat))")
//
//
//        }
//
//    }
    
}
