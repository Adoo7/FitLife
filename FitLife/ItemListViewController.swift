
//
//  ItemListViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 29/12/2022.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDataSource {

    struct Workout {
        let title:String
        let imageName: String
    }
    
    let data:[Workout] = [
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
