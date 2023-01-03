//
//  CalorieCounterViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 01/01/2023.
//

import UIKit

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) != 0 || self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
class CalorieCounterViewController: UIViewController {

    
    
    
    @IBOutlet weak var calorieLabel1: UILabel!
    @IBOutlet weak var slider1Value: UISlider!
    @IBAction func slider1(_ sender: Any) {
        calorieLabel1.text = String(slider1Value.value.clean);
    }
    
    @IBOutlet weak var calorieLabel2: UILabel!
    @IBOutlet weak var slider2Value: UISlider!
    
    @IBAction func slider2(_ sender: Any) {
        calorieLabel2.text = String(slider2Value.value.clean)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
