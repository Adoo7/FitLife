//
//  UserSettingsViewController.swift
//  FitLife
//
//  Created by Ali on 03/01/2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import Foundation

class UserSettingsViewController: UIViewController, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    var first: Int = 0
    var age: Int = 0
    var weight: Int = 0
    var height: Int = 0
    var iutput: Data?
    var output: User?
    var going: User?
    @IBOutlet weak var id: UILabel!
    var random = Int.random(in: 0..<1000)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var weightSliderValue: UISlider!
    @IBOutlet weak var ageSliderValue: UISlider!
    @IBOutlet weak var heightSliderValue: UISlider!
    
    @IBAction func save(_ sender: Any) {
    }
    @IBOutlet weak var date: UIDatePicker!
    @IBAction func ageSlider(_ sender: UISlider) {
        age = Int(sender.value)
        ageLabel.text = "Age " + String(age)
        
        
    }
    @IBAction func heightSlider(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "Height " + String(height)
    }
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBAction func weightSlider(_ sender: UISlider) {
            weight = Int(sender.value)
            weightLabel.text = "Weight " + String(weight)
    }
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    let data = ["Male","Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = "User id: " + String(random)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickSelectedImage))

        //dismiss keyboard functionality
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

        
        imageUser.addGestureRecognizer(tapGesture)
        imageUser.isUserInteractionEnabled = true
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        if UserDefaults.standard.object(forKey: "id") != nil {
            let ids  = String(UserDefaults.standard.integer(forKey: "id"))
            id.text = "User id: " + ids
        }
        if UserDefaults.standard.object(forKey: "name") != nil {
            nameText.text = UserDefaults.standard.string(forKey: "name")
        }
        if UserDefaults.standard.object(forKey: "age") != nil {
            let ages  = String(UserDefaults.standard.integer(forKey: "age"))
            ageLabel.text = "Age " + ages
            ageSliderValue.value = Float(UserDefaults.standard.integer(forKey: "age"))
            age = UserDefaults.standard.integer(forKey: "age")
        }
        if UserDefaults.standard.object(forKey: "weight") != nil {
            let weights  = String(UserDefaults.standard.integer(forKey: "weight"))
            weightLabel.text = "Weight " + weights
            weightSliderValue.value = Float(UserDefaults.standard.integer(forKey: "weight"))
            weight = UserDefaults.standard.integer(forKey: "weight")
        }
        if UserDefaults.standard.object(forKey: "height") != nil {
            let heights  = String(UserDefaults.standard.integer(forKey: "height"))
            heightLabel.text = "Height " + heights
            heightSliderValue.value = Float(UserDefaults.standard.integer(forKey: "height"))
            height = UserDefaults.standard.integer(forKey: "height")
        }
        if UserDefaults.standard.object(forKey: "location") != nil {
            location.text = UserDefaults.standard.string(forKey: "location")
        }
        if UserDefaults.standard.object(forKey: "image") != nil {
            imageUser.image = UIImage(data: UserDefaults.standard.data(forKey: "image")!)
        }
        if UserDefaults.standard.object(forKey: "DOB") != nil {
            let dates = UserDefaults.standard.object(forKey: "DOB") as! Date
            date.date = dates
        }
        if UserDefaults.standard.object(forKey: "gender") != nil{
            genderPicker.selectRow(UserDefaults.standard.integer(forKey: "gender"), inComponent: 0, animated: true)
            first = UserDefaults.standard.integer(forKey: "gender")
            
        }
    
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        first = genderPicker.selectedRow(inComponent: 0)
        let ingdata = imageUser.image?.pngData()
        if let name = nameText.text, let location = location.text, let image = ingdata{
           let user =  User(id: random, name: name , age: age, weight: weight, height: height, gender: first, DOB: date.date, location: location, image: image)
            let userDefaults = UserDefaults.standard
            userDefaults.set(user.id, forKey: "id")
            userDefaults.set(user.name, forKey: "name")
            userDefaults.set(user.age, forKey: "age")
            userDefaults.set(user.weight, forKey: "weight")
            userDefaults.set(user.height, forKey: "height")
            userDefaults.set(user.gender, forKey: "gender")
            userDefaults.set(user.DOB, forKey: "DOB")
            userDefaults.set(user.location, forKey: "location")
            userDefaults.set(user.image, forKey: "image")
            
            iutput = User.save(user)
            
        }
        output = User.load(iutput!)
        going = output
        
    }
    
    func getDocumentsDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String?
    { return data[row] }
    
    
    
    @objc func onClickSelectedImage(sender: UITapGestureRecognizer){
        if sender.state == .ended{
            actionSheet()
        }
    }
    func actionSheet(){
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { (handler) in self.openCamera() }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (handler) in self.openGallery()}))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (handler) in }))
        self.present(alert,animated: true, completion: nil)
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .camera
            image.mediaTypes = [UTType.image.identifier as String]
            self.present(image, animated: true, completion: nil)
        }
    }
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
   
}
extension UserSettingsViewController : UIImagePickerControllerDelegate ,UINavigationBarDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        print(info)
        
        let data = convertFormUIimageTODict(info)
        
        if let editingImage = data[convertInfoKey((UIImagePickerController.InfoKey.editedImage))] as? UIImage{
            print(editingImage)
            self.imageUser.image = editingImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func convertFormUIimageTODict( _ input :[UIImagePickerController.InfoKey: Any]) -> [String : Any]{
        return Dictionary(uniqueKeysWithValues: input.map({key, value in (key.rawValue, value)}))
    }
    
    func convertInfoKey(_ input : UIImagePickerController.InfoKey) -> String{
        return input.rawValue
    }
}
