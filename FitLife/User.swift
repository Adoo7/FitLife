//
//  User.swift
//  FitLife
//
//  Created by Ali on 06/01/2023.
//

import Foundation
import UIKit

class User{
    var id: Int;
    var name: String;
    var age: Int;
    var weight: Int;
    var height: Int;
    var gender: String;
    var DOB: Date;
    var location: String;
    var image: UIImage;
    
    init(id: Int,name: String, age: Int, weight: Int, height: Int, gender: String, DOB: Date, location: String, image: UIImage) {
        self.id = id;
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height
        self.gender = gender
        self.DOB = DOB
        self.location = location
        self.image = image
    }
}
