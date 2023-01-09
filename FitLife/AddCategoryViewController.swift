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

        // Do any additional setup after loading the view.
    }
    required init?(coder: NSCoder, category: Category?) {
        self.category = category
        super.init(coder: coder)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let name = categoryName.text
        {
            category = Category(title: name, image: "Bodybuilding_Image")
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
