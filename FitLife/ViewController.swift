//
//  ViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 25/12/2022.
//

import UIKit

class ViewController: UIViewController {
    var waterCounter = 0;
    var sliderArray: [String] = []
    
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let userDefaults = UserDefaults.standard
        let totalCals = userDefaults.string(forKey: "totalCals") as? String
        print("VIEWCONTROLLER CALS")
        print(totalCals)
        caloriesLbl.text = totalCals
        
    }
    
    @IBOutlet weak var waterLabel: UILabel!
    
    @IBAction func decreaseWater(_ sender: Any) {
        if(waterCounter == 0)
        {
            
        }
        else
        {
            waterCounter = waterCounter - 1;
            waterLabel.text = "\(waterCounter)/8";
        }
        
    }
    
    @IBAction func increaseWater(_ sender: Any) {
        waterCounter = waterCounter + 1;
        waterLabel.text = "\(waterCounter)/8";
    }
    var calorieLabelsArr: [String] = []
    var calorieSlidersArr: [String] = []
    
    
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var profilepic: UIImageView!
    
    @IBAction func unwindToHomePage(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? CalorieCounterViewController
        let source = unwindSegue.source as? UserSettingsViewController
        
        if let change = (source? .going){
            let name = change.name
            userName.text = name
            
            let weights = change.weight
            weight.text = String(weights)

            profilepic.image = UIImage(data: change.image)
            
        }
        
        // Use data from the view controller which initiated the unwind segue
        if let changeText = (sourceViewController?.totalCalories)
        {
            caloriesLbl.text = String(changeText)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? CalorieCounterViewController
        destinationVC?.slidersArr = sliderArray
    }
    
    
    
}

