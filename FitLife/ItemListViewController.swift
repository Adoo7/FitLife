
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
    var duration: Int
    var description: String
    var difficulty: String
}

class ItemListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var workout: Workout?
    var selectedWorkout: Workout?
    var data:[Workout] = [
        Workout(title: "Bench Press", imageName: "FitLife_Logo", duration: 5, description: "pressing the bar bell upwards while laying down on the bench", difficulty: "Medium"),
        Workout(title: "Dumbell Curl", imageName: "FitLife_Logo", duration: 7, description: "Curling the dubell towards the chest and flattening the arm in repetition", difficulty: "Easy"),
        Workout(title: "Shoulder Press", imageName: "FitLife_Logo", duration: 4, description: "Pressing the bar bell over the head while engaging the shoulder muscles", difficulty: "Hard"),
        Workout(title: "Leg Press", imageName: "FitLife_Logo", duration: 7, description: "Press the weight away from the body using the leg press machine", difficulty: "Easy")
    ]
    
    @IBOutlet weak var itemTable: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemTable.dataSource = self
        itemTable.delegate = self
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWorkout = data[indexPath.row]
        print("selected row \(indexPath.row)")
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let vc = segue.destination as? ItemDetailViewController
        
        if segue.identifier == "viewItem" {
            
            let vc = segue.destination as? ItemDetailViewController
            vc?.workout = selectedWorkout
            
        }
        
    }
    
}
