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

        
        if let passedWorkout = workout {
            itemNameField.text = passedWorkout.title
            durationSlider.value =  Float(passedWorkout.duration)
            descriptionField.text = passedWorkout.description
            sliderLabel.text = String(passedWorkout.duration)
            
//            pickerData[iconPicker.selectedRow(inComponent: 0)] = passedWorkout.imageName
//            difficultyPickerData[difficultyPicker.selectedRow(inComponent: 0)] = passedWorkout.difficulty
        }
            
        // Do any additional setup after loading the view.
        self.difficultyPicker.dataSource = self
        self.difficultyPicker.delegate = self
        self.iconPicker.dataSource = self
        self.iconPicker.delegate = self
    }
    
    
    @IBOutlet weak var difficultyPicker: UIPickerView!
    @IBOutlet weak var iconPicker: UIPickerView!
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBAction func sliderMoved(_ sender: Any) {
        sliderLabel.text = String(Int(durationSlider.value))
    }
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let iconString = pickerData[iconPicker.selectedRow(inComponent: 0)]
        let difficulty = difficultyPickerData[difficultyPicker.selectedRow(inComponent: 0)]
        
        if let name = itemNameField.text, let description = descriptionField.text
        {
            workout = Workout(title: name, imageName: iconString, duration: Int(durationSlider.value), description: description, difficulty: difficulty)
            print("prepared for segue\n workout passed: \(workout!)")
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
