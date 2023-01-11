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
        //run the updateUI() function
        updateUI()
    }

    
    //Creating outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    //Creating an updateUI() function
    func updateUI() {
        
        //setting time to the workout.duration
        if let time = workout?.duration {
            //setting the text of the time labbel
            timeLbl.text = "Time: \(time)"
        } else {
            //if doesnt exist make time unspecified
            timeLbl.text = "Time: unspecified"
        }
        //set the title label to the workout's title
        titleLbl.text = workout?.title
        //set the description label to the workout description
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
