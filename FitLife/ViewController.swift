//
//  ViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 25/12/2022.
//

import UIKit

class ViewController: UIViewController {
    var waterCounter = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    var calorieSlidersArr: [Int32] = []
    
    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBAction func unwindToHomePage(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? CalorieCounterViewController
        // Use data from the view controller which initiated the unwind segue
        if let changeText = (sourceViewController?.totalCals)
        {
            caloriesLbl.text = String(changeText)
        }
    }
    
    
}

