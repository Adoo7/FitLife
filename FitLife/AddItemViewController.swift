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
    var pickerData: [String] = [
        "cardio",
        "weights",
        "calesthenics",
        "swimming"
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
        
        // Do any additional setup after loading the view.
        self.iconPicker.dataSource = self
        self.iconPicker.delegate = self
    }
    
    
    @IBOutlet weak var iconPicker: UIPickerView!
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBAction func sliderMoved(_ sender: Any) {
        sliderLabel.text = String(Int(durationSlider.value))
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let name = itemNameField.text
        {
            workout = Workout(title: name, imageName: "FitLife_Logo")
            print("prepared for segue\n \(workout!)")
        }
        
    }
    
}

extension AddItemViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
}

extension AddItemViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
