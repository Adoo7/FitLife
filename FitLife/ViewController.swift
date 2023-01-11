//
//  ViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 25/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //defining variales
    var waterCounter = 0;
    var sliderArray: [String] = []
    
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //dismiss keyboard when tapping away
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

        // displaying data and retreving data from user defaults
        if UserDefaults.standard.object(forKey: "name") != nil {
            userName.text = UserDefaults.standard.string(forKey: "name")
        }
        if UserDefaults.standard.object(forKey: "weight") != nil {
            let weights  = String(UserDefaults.standard.integer(forKey: "weight"))
            weight.text = weights + "kg"
        }
        //BMI calculator with userDefaults
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
            if UserDefaults.standard.object(forKey: "image") != nil {
                profilepic.image = UIImage(data: UserDefaults.standard.data(forKey: "image")!)
            }
            if UserDefaults.standard.object(forKey: "waterCounter") != nil {
                waterCounter = UserDefaults.standard.integer(forKey: "waterCounter")
                let water = String(waterCounter) + "/8"
                waterLabel.text = water
            }
        }
        //getting the total calories from UserDefaults into a variable and displaying it on the page
        let userDefaults = UserDefaults.standard
        let totalCals = userDefaults.string(forKey: "totalCals") as? String
        print("VIEWCONTROLLER CALS")
        print(totalCals)
        caloriesLbl.text = totalCals
        
    }
    //define a waterLabel outlet
    @IBOutlet weak var waterLabel: UILabel!
    
    
    //function for decreasing water
    @IBAction func decreaseWater(_ sender: Any) {
        if(waterCounter == 0)
        {
            
        }
        else
        {
            //appending the text to the screen and saving the number into a UserDefaults key
            waterCounter = waterCounter - 1;
            waterLabel.text = "\(waterCounter)/8";
            UserDefaults.standard.set(waterCounter, forKey: "waterCounter")
        }
        
    }
    //function for increasing water
    @IBAction func increaseWater(_ sender: Any) {
        //appending the text to the screen and saving the number into a UserDefaults key
        waterCounter = waterCounter + 1;
        waterLabel.text = "\(waterCounter)/8";
        UserDefaults.standard.set(waterCounter, forKey: "waterCounter")
    }
    //defining a string arraay for the sliders and labels value for the CalorieCounterViewController
    var calorieLabelsArr: [String] = []
    var calorieSlidersArr: [String] = []
    
    
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var profilepic: UIImageView!
    //getting data segue
    @IBAction func unwindToHomePage(_ unwindSegue: UIStoryboardSegue) {
        //source of data is CalorieCounterViewController
        let sourceViewController = unwindSegue.source as? CalorieCounterViewController
        //source of data is usersettings
        let source = unwindSegue.source as? UserSettingsViewController
        //loading the User object from the load function
        //getting data and displaying them
        if let change = (source? .going){
            let name = change.name
            userName.text = name
            
            let weights = change.weight
            weight.text = String(weights)+"kg"

            profilepic.image = UIImage(data: change.image)
            //BMI formula
            let bmi = Float(change.weight) / pow(Float(change.height)/100, 2)
            //storing bmi in user defaults
            UserDefaults.standard.set(bmi, forKey: "bmi")
            //bmi calculator in logic to display
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
            //setting the calories label on the home page equal to the total calories set in the calories page
            caloriesLbl.text = String(changeText)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //store the sliders array locally for saving purposes
        let destinationVC = segue.destination as? CalorieCounterViewController
        destinationVC?.slidersArr = sliderArray
        
    }
    
    
    
}

