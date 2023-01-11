//
//  AddCategoryViewController.swift
//  FitLife
//
//  Created by Student on 09/01/2023.
//

import UIKit

class AddCategoryViewController: UIViewController {

    @IBOutlet weak var categoryName: UITextField!
    
    var category: Category?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dismiss keyboard
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

        //display when edit is clicked
        if let passedCategory = category {
            categoryName.text = passedCategory.title
        }

        // Do any additional setup after loading the view.
    }
    //creating an object of category
    required init?(coder: NSCoder, category: Category?) {
        self.category = category
        super.init(coder: coder)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    //when the save button is clicked, adding the information to the new category
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let name = categoryName.text
        {
            category = Category(title: name, image: "Bodybuilding_Image", workouts: [])
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

}
