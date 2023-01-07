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


    
    var totalCalories = 5
    var totalCals = 2
    
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
    
    @IBOutlet weak var calorieLabel3: UILabel!
    @IBOutlet weak var slider3Value: UISlider!
    @IBAction func slider3(_ sender: Any) {
        calorieLabel3.text = String(slider3Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel4: UILabel!
    @IBOutlet weak var slider4Value: UISlider!
    @IBAction func slider4(_ sender: Any) {
        calorieLabel4.text = String(slider4Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel5: UILabel!
    @IBOutlet weak var slider5Value: UISlider!
    @IBAction func slider5(_ sender: Any) {
        calorieLabel5.text = String(slider5Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel6: UILabel!
    @IBOutlet weak var slider6Value: UISlider!
    @IBAction func slider6(_ sender: Any) {
        calorieLabel6.text = String(slider6Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel7: UILabel!
    @IBOutlet weak var slider7Value: UISlider!
    @IBAction func slider7(_ sender: Any) {
        calorieLabel7.text = String(slider7Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel8: UILabel!
    @IBOutlet weak var slider8Value: UISlider!
    @IBAction func slider8(_ sender: Any) {
        calorieLabel8.text = String(slider8Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel9: UILabel!
    @IBOutlet weak var slider9Value: UISlider!
    @IBAction func slider9(_ sender: Any) {
        calorieLabel9.text = String(slider9Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel10: UILabel!
    @IBOutlet weak var slider10Value: UISlider!
    @IBAction func slider10(_ sender: Any) {
        calorieLabel10.text = String(slider10Value.value.clean)
    }
    
    @IBOutlet weak var calorieLabel11: UILabel!
    @IBOutlet weak var slider11Value: UISlider!
    @IBAction func slider11(_ sender: Any) {
        calorieLabel11.text = String(slider11Value.value.clean)
    }
    

    
    
    @IBAction func saveBtn(_ sender: Any) {}
    
    var labelsArr: [String] = []
    var slidersArr: [Int32] = []
    
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lbl1 = slider1Value.value
        let lbl2 = slider2Value.value
        let lbl3 = slider3Value.value
        let lbl4 = slider4Value.value
        let lbl5 = slider5Value.value
        let lbl6 = slider6Value.value
        let lbl7 = slider7Value.value
        let lbl8 = slider8Value.value
        let lbl9 = slider9Value.value
        let lbl10 = slider10Value.value
        let lbl11 = slider11Value.value
        totalCalories = Int(lbl1+lbl2+lbl3+lbl4+lbl5+lbl6+lbl7+lbl8+lbl9+lbl10+lbl11)
        totalCals = totalCalories
    }

}
