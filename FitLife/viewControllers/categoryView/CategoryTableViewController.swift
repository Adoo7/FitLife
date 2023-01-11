//
//  CategoryTableViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 30/12/2022.
//

import UIKit

class Category:Codable {
    internal init(title: String, image: String, workouts: [Workout]) {
        self.title = title
        self.image = image
        self.workouts = workouts
    }
    
    let title: String
    let image: String
    var workouts: [Workout]
}

class CategoryTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cat: Category?
    var checkIfEdit = false
    var indexOfCategory = 0
    
    var workoutList:[Workout] = [
        Workout(title: "Bench Press", imageName: "FitLife_Logo", duration: 5, description: "pressing the bar bell upwards while laying down on the bench", difficulty: "Medium"),
        Workout(title: "Dumbell Curl", imageName: "FitLife_Logo", duration: 7, description: "Curling the dubell towards the chest and flattening the arm in repetition", difficulty: "Easy"),
        Workout(title: "Shoulder Press", imageName: "FitLife_Logo", duration: 4, description: "Pressing the bar bell over the head while engaging the shoulder muscles", difficulty: "Hard"),
        Workout(title: "Leg Press", imageName: "FitLife_Logo", duration: 7, description: "Press the weight away from the body using the leg press machine", difficulty: "Easy")
    ]
    
    //list of beginning categories
    var list: [Category] = [
        Category(title: "Bodybuilding", image: "Bodybuilding_Image", workouts: []),
        Category(title: "Crossfit", image: "Crossfit_Image", workouts: []),
        Category(title: "HIIT", image: "HIIT_Image", workouts: []),
        Category(title: "Yoga", image: "Yoga_Image", workouts: [])
    ]
    
    //in case a reset button need to be added in the future
    var presetCategories: [Category] = [
        Category(title: "Bodybuilding", image: "Bodybuilding_Image", workouts: []),
        Category(title: "Crossfit", image: "Crossfit_Image", workouts: []),
        Category(title: "HIIT", image: "HIIT_Image", workouts: []),
        Category(title: "Yoga", image: "Yoga_Image", workouts: [])
    ]
    
   
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        var i = 0
        for workingCategory in list {
            i += 1
            workingCategory.workouts = workoutList
        }
        if let categories = UserDefaults.standard.object(forKey: "allCategories") as? Data, let data = try? JSONDecoder().decode([Category].self, from: categories) {
                list = data
        }
        
            
        
        
        
        categoryTable.dataSource = self
        categoryTable.delegate = self
        update()
    }

    // MARK: - Table view data source
     
    //number of rows
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
    //function to make the tableView swipe
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //to edit the category
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            print("edit")
            self.indexOfCategory = indexPath.row
            self.checkIfEdit = true
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCategoryViewController") as! AddCategoryViewController
            vc.category = self.list[indexPath.row]
            self.present(vc, animated: true)
            completionHandler(true)
            
        }
        //to delete the category
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
        indexOfCategory = indexPath.row
        print("selected row \(indexPath.row)")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        vc.category = cat
        vc.allCategories = list
        vc.categoryIndex = indexOfCategory
        self.present(vc, animated: true)

        
    }
    //refreshes the table view
    func update(){
        categoryTable.reloadData()
        print("updated data, rows: \(list.count)")
    }
    
    //to save and display the data when the save buttoon is clicked in the "addCategory" page
    @IBAction func unwindToCategoryList(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? AddCategoryViewController
        
        // Use data from the view controller which initiated the unwind segue
        if let category = sourceViewController?.category {
            if checkIfEdit == false {
                //appending item to array and saving data
                print("edit is false")
                list.append(category)
                if let encoded = try? JSONEncoder().encode(list) {
                    UserDefaults.standard.set(encoded, forKey: "allCategories")
                }
                print("added to array and saved to user defaults")
                
            } else {
                //replacing item in index and saving
                print("edit is true")
                list[indexOfCategory] = category
                if let encoded = try? JSONEncoder().encode(list) {
                    UserDefaults.standard.set(encoded, forKey: "allCategories")
                }
                print("item has been replaced")
                checkIfEdit = false
            }
            print("added to array")
        } else {
            print("operation cancelled")
        }
        
        update()
    }
    
    //to transition to Add Category controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewItem" {
            
            let vc = segue.destination as? AddCategoryViewController
            vc?.category = cat
            
        } else if segue.identifier == "editItem"{
            
            let vc = segue.destination as? AddCategoryViewController
            vc?.category = cat
        
        }
        
    }
}


