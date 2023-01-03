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
    
}

