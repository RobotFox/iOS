//
//  Contact.swift
//  TheContact
//
//  Created by Sam on 18/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation


class Contact {
    
    let id:Int64?
    
    var name:String
    
    var surname:String
    
    var phone:String
    
    
    
    init(id:Int64) {
        self.id = id
        name = ""
        surname = ""
        phone = ""
    }
    
    
    init(id:Int64, name:String, surname:String, phone:String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.phone = phone
    }
}
