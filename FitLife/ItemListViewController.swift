
//
//  ItemListViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 29/12/2022.
//

import UIKit

struct Workout {
    var title:String
    var imageName: String
}

class ItemListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var workout: Workout?
    var data:[Workout] = [
        Workout(title: "Bench Press", imageName: "FitLife_Logo"),
        Workout(title: "Dumbell Curl", imageName: "FitLife_Logo"),
        Workout(title: "Shoulder Press", imageName: "FitLife_Logo"),
        Workout(title: "Leg Press", imageName: "FitLife_Logo")
    ]
    
    @IBOutlet weak var itemTable: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemTable.dataSource = self
        updateUI()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let workout = data[indexPath.row]
        let cell = itemTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        cell.label.text = workout.title
        cell.iconImage.image = UIImage(named: workout.imageName)
        return cell
    }

    
    
    func updateUI(){
        itemTable.reloadData()
        print("updated data")
        print("rows: \(data.count)")
    }
    
    @IBAction func unwindToItemList(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? AddItemViewController
        // Use data from the view controller which initiated the unwind segue
        if let workout = sourceViewController?.workout {
            data.append(workout)
            print("added to array")
        } else {
            print("data is incomplete")
        }
            
        updateUI()
    }
    
}
