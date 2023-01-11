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
    //intilizing variables
    var first: Int = 0
    var age: Int = 0
    var weight: Int = 0
    var height: Int = 0
    var iutput: Data?
    var output: User?
    var going: User?
    @IBOutlet weak var id: UILabel!
    //generating random ids
    var random = Int.random(in: 0..<1000)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var weightSliderValue: UISlider!
    @IBOutlet weak var ageSliderValue: UISlider!
    @IBOutlet weak var heightSliderValue: UISlider!
    //save button
    @IBAction func save(_ sender: Any) {
    }
    //sliders and pickers
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
    //list for the Picker UI
    let data = ["Male","Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the id label
        id.text = "User id: " + String(random)
        //making the imageview clickable and passing onclickselected image function
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickSelectedImage))

        //dismiss keyboard functionality
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

        //enabling user interaction and adding gesture recongizer
        imageUser.addGestureRecognizer(tapGesture)
        imageUser.isUserInteractionEnabled = true
        //picker data source and delegate
        genderPicker.dataSource = self
        genderPicker.delegate = self
        // loading userdeaults on the page if it exists
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
    //once the user clicks on the save button this segue sends the necessary the view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        first = genderPicker.selectedRow(inComponent: 0)
        //encoding the image to pngdata
        let ingdata = imageUser.image?.pngData()
        //initating the User object
        if let name = nameText.text, let location = location.text, let image = ingdata{
           let user =  User(id: random, name: name , age: age, weight: weight, height: height, gender: first, DOB: date.date, location: location, image: image)
            //initiating userdefaults and storing user objects data
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
            //encoding
            iutput = User.save(user)
            
        }
        //decoding
        output = User.load(iutput!)
        going = output
        
    }
    //setting up picker view aand getting dataa
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String?
    { return data[row] }
    
    //fuction that gets called when we click on view image
    @objc func onClickSelectedImage(sender: UITapGestureRecognizer){
        if sender.state == .ended{
            actionSheet()
        }
    }
    //function to show us a sheet of alert actions to choose one option
    func actionSheet(){
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (handler) in self.openGallery()}))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (handler) in }))
        self.present(alert,animated: true, completion: nil)
    }
    //opens the gallery
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
   
}//extending the view controller
extension UserSettingsViewController : UIImagePickerControllerDelegate ,UINavigationBarDelegate{
    //function the sets aand encode and decode the choosen image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        print(info)
        
        let data = convertFormUIimageTODict(info)
        
        if let editingImage = data[convertInfoKey((UIImagePickerController.InfoKey.editedImage))] as? UIImage{
            print(editingImage)
            self.imageUser.image = editingImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    //cancel button
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    //converting image to dictionary
    func convertFormUIimageTODict( _ input :[UIImagePickerController.InfoKey: Any]) -> [String : Any]{
        return Dictionary(uniqueKeysWithValues: input.map({key, value in (key.rawValue, value)}))
    }
    //returns the rawvaalue as a string to the convertformuimagetodict function
    func convertInfoKey(_ input : UIImagePickerController.InfoKey) -> String{
        return input.rawValue
    }
}
