//
//  UserSettingsViewController.swift
//  FitLife
//
//  Created by Ali on 03/01/2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers




class UserSettingsViewController: UIViewController, UINavigationControllerDelegate{

    @IBOutlet weak var userImage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSelectedImage(_ sender: Any){
        actionSheet()
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
            self.userImage.setImage(editingImage, for: .normal)
            
        
        
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
