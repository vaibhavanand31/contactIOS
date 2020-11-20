//
//  Person.swift
//  Contacts
//
//  Created by Vaibhav Anand on 2020-11-18.
//

import Foundation
import UIKit

class Person: NSObject, NSCoding {
    
    var name: String
    var phoneNumber: Int
    var isFavorite: Bool = false
    var image: UIImage? = nil
    
    init(name: String, phoneNumber: Int) {
        self.name = name;
        self.phoneNumber = phoneNumber
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        phoneNumber = coder.decodeInteger(forKey: "phoneNumber")
        isFavorite = coder.decodeBool(forKey: "isFavorite") 
        image = coder.decodeObject(forKey: "image") as! UIImage?
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: "name")
        aCoder.encode(phoneNumber, forKey: "phoneNumber")
        aCoder.encode(isFavorite, forKey: "isFavorite")
        aCoder.encode(image, forKey: "image")
    }
}
