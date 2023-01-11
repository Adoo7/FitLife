//
//  AddItemViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 03/01/2023.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var workout: Workout?
    var workoutName: String?
    var imageString: String?
    var iconTitle: String?
    var indexOfWorkout: Int = 0
    var pickerData: [String] = [
        "cardio",
        "weights",
        "calesthenics",
        "swimming"
    ]
//    var pickerIndex = 0
//    var picker2Index = 0
    var difficultyPickerData: [String] = [
        "Easy",
        "Medium",
        "Hard"
    ]
    
    required init?(coder: NSCoder, workout: Workout?) {
        self.workout = workout
        super.init(coder: coder)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dismiss keyboard functionality
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
            
        // Do any additional setup after loading the view.
        self.difficultyPicker.dataSource = self
        self.difficultyPicker.delegate = self
        self.iconPicker.dataSource = self
        self.iconPicker.delegate = self
        
        
        //check if there is a workout item being passed into view
        //if there is, then display its attributes
        if let passedWorkout = workout {
            
            itemNameField.text = passedWorkout.title
            durationSlider.value =  Float(passedWorkout.duration)
            descriptionField.text = passedWorkout.description
            sliderLabel.text = String(passedWorkout.duration)
            iconPicker.selectRow(passedWorkout.pickerIndex, inComponent: 0, animated: true)
            difficultyPicker.selectRow(passedWorkout.picker2Index, inComponent: 0, animated: true)
            
            print(passedWorkout.pickerIndex)
            print(passedWorkout.picker2Index)
            print("workout passed into view and variables set")
            
        }
        
    }
    
    
    @IBOutlet weak var difficultyPicker: UIPickerView!
    @IBOutlet weak var iconPicker: UIPickerView!
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBAction func sliderMoved(_ sender: Any) {
        sliderLabel.text = String(Int(durationSlider.value))
    }
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBAction func saveButtonPressed(_ sender: Any) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let iconString = pickerData[iconPicker.selectedRow(inComponent: 0)]
        let difficulty = difficultyPickerData[difficultyPicker.selectedRow(inComponent: 0)]
        
        if let name = itemNameField.text, let description = descriptionField.text
        {
            workout = Workout(title: name, imageName: iconString, duration: Int(durationSlider.value), description: description, difficulty: difficulty, pickerIndex: iconPicker.selectedRow(inComponent: 0), picker2Index: difficultyPicker.selectedRow(inComponent: 0))
            print("prepared for segue\n workout passed: \(workout!)")
            print("picker 1: \(workout?.pickerIndex)")
            print("picker 2: \(workout?.picker2Index)")
        }
        
    }
    
}

extension AddItemViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return pickerData.count
        } else {
            return difficultyPickerData.count
        }
        
    }
    
}

extension AddItemViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return pickerData[row]
        } else {
            return difficultyPickerData[row]
        }
    }
}
