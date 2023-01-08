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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBOutlet weak var waterLabel: UILabel!
    
    @IBAction func decreaseWater(_ sender: Any) {
        if(waterCounter == 0)
        {
            let userDefaults = UserDefaults.standard
            let strings = userDefaults.object(forKey: "sliderArray") as? [String]
            
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
    
    @IBAction func unwindToHomePage(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? CalorieCounterViewController
        // Use data from the view controller which initiated the unwind segue
        if let changeText = (sourceViewController?.totalCalories), let arr1 = sourceViewController?.slidersArr
        {
            caloriesLbl.text = String(changeText)
            
            
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? CalorieCounterViewController
        destinationVC?.slidersArr = sliderArray
    }
    
    
    
}

