//
//  User.swift
//  FitLife
//
//  Created by Ali on 06/01/2023.
//

import Foundation
import UIKit

//declaring class user with codaable protocol

class User: Codable{
    //attributres
    var id: Int;
    var name: String;
    var age: Int;
    var weight: Int;
    var height: Int;
    var gender: Int;
    var DOB: Date;
    var location: String;
    var image: Data;
    //custom constructor
    init(id: Int,name: String, age: Int, weight: Int, height: Int, gender: Int, DOB: Date, location: String, image: Data){
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
    //encoder behaviour
    static func save(_ user: User) -> Data{
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(user)
       // let string = String(data: data, encoding: .utf8)!
        return data
    }
    //decoder behaaviour
    static func load(_ user: Data) -> User{
        let jasonDecoder = JSONDecoder()
        let data = try! jasonDecoder.decode(User.self ,from: user)
        return data
    }
    
}
