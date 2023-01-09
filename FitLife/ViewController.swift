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
    
    @IBOutlet weak var bmiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.object(forKey: "name") != nil {
            userName.text = UserDefaults.standard.string(forKey: "name")
        }
        if UserDefaults.standard.object(forKey: "weight") != nil {
            let weights  = String(UserDefaults.standard.integer(forKey: "weight"))
            weight.text = weights + "kg"
        }
        if UserDefaults.standard.object(forKey: "bmi") != nil {
            let bmi = UserDefaults.standard.float(forKey: "bmi")
            if bmi < 18.5{
                bmiLabel.text = "Under weight " + String(format: "%.1f", bmi)
            }else if bmi >= 18.5 && bmi <= 24.9{
                bmiLabel.text = "Healthy weight " + String(format: "%.1f", bmi)
            }else if bmi >= 25.0 && bmi <= 29.9{
                bmiLabel.text = "Overweight " + String(format: "%.1f", bmi)
            }else if bmi >= 30{
                bmiLabel.text = "Obese " + String(format: "%.1f", bmi)
            }
        }
        
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
            weight.text = String(weights)+"kg"

            profilepic.image = UIImage(data: change.image)
            
            let bmi = Float(change.weight) / pow(Float(change.height)/100, 2)
            
            UserDefaults.standard.set(bmi, forKey: "bmi")
            
            if bmi < 18.5{
                bmiLabel.text = "Under weight " + String(format: "%.1f", bmi)
            }else if bmi >= 18.5 && bmi <= 24.9{
                bmiLabel.text = "Healthy weight " + String(format: "%.1f", bmi)
            }else if bmi >= 25.0 && bmi <= 29.9{
                bmiLabel.text = "Overweight " + String(format: "%.1f", bmi)
            }else if bmi >= 30{
                bmiLabel.text = "Obese " + String(format: "%.1f", bmi)
            }

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

