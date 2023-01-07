//
//  UserSettingsViewController.swift
//  FitLife
//
//  Created by Ali on 03/01/2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class UserSettingsViewController: UIViewController, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var id: UILabel!
    var random = Int.random(in: 0..<1000)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var imageUser: UIImageView!
    
    @IBOutlet weak var date: UIDatePicker!
    @IBAction func ageSlider(_ sender: UISlider) {
        ageLabel.text = "Age " + String(Int(sender.value))
    }
    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = "Height " + String(Int(sender.value))
    }
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = "Weight " + String(Int(sender.value))
    }
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    let data = ["Male","Female"]

    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = "User id: " + String(random)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickSelectedImage))
        
        imageUser.addGestureRecognizer(tapGesture)
        
        imageUser.isUserInteractionEnabled = true
        
        genderPicker.dataSource = self
        genderPicker.delegate = self

        // Do any additional setup after loading the view.
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



