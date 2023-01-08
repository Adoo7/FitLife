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


    
    var totalCalories = 0
    var labelsArr: [String] = []
    var slidersArr: [String] = []
    
    
    
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var calorieLabel1: UILabel!
    @IBOutlet weak var slider1Value: UISlider!
    @IBAction func slider1(_ sender: Any) {
        calorieLabel1.text = String(slider1Value.value.clean);
    }
    
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var calorieLabel2: UILabel!
    @IBOutlet weak var slider2Value: UISlider!
    @IBAction func slider2(_ sender: Any) {
        calorieLabel2.text = String(slider2Value.value.clean)
    }
    
    @IBOutlet weak var textBox3: UITextField!
    @IBOutlet weak var calorieLabel3: UILabel!
    @IBOutlet weak var slider3Value: UISlider!
    @IBAction func slider3(_ sender: Any) {
        calorieLabel3.text = String(slider3Value.value.clean)
    }
    
    @IBOutlet weak var textBox4: UITextField!
    @IBOutlet weak var calorieLabel4: UILabel!
    @IBOutlet weak var slider4Value: UISlider!
    @IBAction func slider4(_ sender: Any) {
        calorieLabel4.text = String(slider4Value.value.clean)
    }
    
    @IBOutlet weak var textBox5: UITextField!
    @IBOutlet weak var calorieLabel5: UILabel!
    @IBOutlet weak var slider5Value: UISlider!
    @IBAction func slider5(_ sender: Any) {
        calorieLabel5.text = String(slider5Value.value.clean)
    }
    
    @IBOutlet weak var textBox6: UITextField!
    @IBOutlet weak var calorieLabel6: UILabel!
    @IBOutlet weak var slider6Value: UISlider!
    @IBAction func slider6(_ sender: Any) {
        calorieLabel6.text = String(slider6Value.value.clean)
    }
    
    @IBOutlet weak var textBox7: UITextField!
    @IBOutlet weak var calorieLabel7: UILabel!
    @IBOutlet weak var slider7Value: UISlider!
    @IBAction func slider7(_ sender: Any) {
        calorieLabel7.text = String(slider7Value.value.clean)
    }
    
    @IBOutlet weak var textBox8: UITextField!
    @IBOutlet weak var calorieLabel8: UILabel!
    @IBOutlet weak var slider8Value: UISlider!
    @IBAction func slider8(_ sender: Any) {
        calorieLabel8.text = String(slider8Value.value.clean)
    }
    
    @IBOutlet weak var textBox9: UITextField!
    @IBOutlet weak var calorieLabel9: UILabel!
    @IBOutlet weak var slider9Value: UISlider!
    @IBAction func slider9(_ sender: Any) {
        calorieLabel9.text = String(slider9Value.value.clean)
    }
    
    @IBOutlet weak var textBox10: UITextField!
    @IBOutlet weak var calorieLabel10: UILabel!
    @IBOutlet weak var slider10Value: UISlider!
    @IBAction func slider10(_ sender: Any) {
        calorieLabel10.text = String(slider10Value.value.clean)
    }
    
    @IBOutlet weak var textBox11: UITextField!
    @IBOutlet weak var calorieLabel11: UILabel!
    @IBOutlet weak var slider11Value: UISlider!
    @IBAction func slider11(_ sender: Any) {
        calorieLabel11.text = String(slider11Value.value.clean)
    }
    

    
    
    @IBAction func saveBtn(_ sender: Any) {
        if let calorie1 = (calorieLabel1.text), let calorie2 = calorieLabel2.text, let calorie3 = calorieLabel3.text, let calorie4 = calorieLabel4.text, let calorie5 = calorieLabel5.text, let calorie6 = calorieLabel6.text, let calorie7 = calorieLabel7.text, let calorie8 = calorieLabel8.text, let calorie9 = calorieLabel9.text, let calorie10 = calorieLabel10.text, let calorie11 = calorieLabel11.text, let box1 = textBox1.text, let box2 = textBox2.text, let box3 = textBox3.text, let box4 = textBox4.text, let box5 = textBox5.text, let box6 = textBox6.text, let box7 = textBox7.text, let box8 = textBox8.text, let box9 = textBox9.text, let box10 = textBox10.text, let box11 = textBox11.text
        {
            labelsArr.append(box1)
            labelsArr.append(box2)
            labelsArr.append(box3)
            labelsArr.append(box4)
            labelsArr.append(box5)
            labelsArr.append(box6)
            labelsArr.append(box7)
            labelsArr.append(box8)
            labelsArr.append(box9)
            labelsArr.append(box10)
            labelsArr.append(box11)
            
            slidersArr.append(calorie1)
            slidersArr.append(calorie2)
            slidersArr.append(calorie3)
            slidersArr.append(calorie4)
            slidersArr.append(calorie5)
            slidersArr.append(calorie6)
            slidersArr.append(calorie7)
            slidersArr.append(calorie8)
            slidersArr.append(calorie9)
            slidersArr.append(calorie10)
            slidersArr.append(calorie11)
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(slidersArr, forKey: "sliderArray")
            print("labels array is")
            print(labelsArr)
            print(labelsArr)
            print(labelsArr)
            userDefaults.set(labelsArr, forKey: "labelArray")
            
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
            let totalCals = Int(lbl1+lbl2+lbl3+lbl4+lbl5+lbl6+lbl7+lbl8+lbl9+lbl10+lbl11)
            print("SAVE BUTTON CALS")
            print(totalCals)
            userDefaults.set(totalCals, forKey: "totalCals")
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let userDefaults = UserDefaults.standard
        let strings = userDefaults.object(forKey: "sliderArray") as? [String]
        let labels = userDefaults.object(forKey: "labelArray") as? [String]
        print(labels)
        if(strings != nil)
        {
            calorieLabel1.text = strings![0]
            calorieLabel2.text = strings![1]
            calorieLabel3.text = strings![2]
            calorieLabel4.text = strings![3]
            calorieLabel5.text = strings![4]
            calorieLabel6.text = strings![5]
            calorieLabel7.text = strings![6]
            calorieLabel8.text = strings![7]
            calorieLabel9.text = strings![8]
            calorieLabel10.text = strings![9]
            calorieLabel11.text = strings![10]
            
            slider1Value.value = Float(strings![0])!
            slider2Value.value = Float(strings![1])!
            slider3Value.value = Float(strings![2])!
            slider4Value.value = Float(strings![3])!
            slider5Value.value = Float(strings![4])!
            slider6Value.value = Float(strings![5])!
            slider7Value.value = Float(strings![6])!
            slider8Value.value = Float(strings![7])!
            slider9Value.value = Float(strings![8])!
            slider10Value.value = Float(strings![9])!
            slider11Value.value = Float(strings![10])!
        }
        if(labels != nil)
        {
            textBox1.text = labels![0]
            textBox2.text = labels![1]
            textBox3.text = labels![2]
            textBox4.text = labels![3]
            textBox5.text = labels![4]
            textBox6.text = labels![5]
            textBox7.text = labels![6]
            textBox8.text = labels![7]
            textBox9.text = labels![8]
            textBox10.text = labels![9]
            textBox11.text = labels![10]
        }
        
        
        
        
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
        
        
    }

}
