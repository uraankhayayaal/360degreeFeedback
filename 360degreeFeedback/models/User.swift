//
//  User.swift
//  360degreeFeedback
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import SwiftyJSON

struct User {
    var id : Int
    var name : String
    
    var isAuth : Bool {
        return id != -1
    }
    
    init(_ name : String) {
        self.id = -1
        self.name = name
    }
    
    init(_ json : JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
    }
    
}
