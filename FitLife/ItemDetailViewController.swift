//
//  ItemDetailViewController.swift
//  FitLife
//
//  Created by ahmed sarhan on 08/01/2023.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    var workout: Workout?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }

    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func updateUI() {
        
        if let time = workout?.duration {
            timeLbl.text = "Time: \(time)"
        } else {
            timeLbl.text = "Time: unspecified"
        }
        
        titleLbl.text = workout?.title
        descriptionLbl.text = workout?.description
        
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
