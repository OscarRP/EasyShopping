//
//  User.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 31/5/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject, NSCoding {
    
    var email: String!
    var nick: String!
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.email = decoder.decodeObject(forKey: "email") as! String
        self.nick = decoder.decodeObject(forKey: "nick") as! String
    }
    
    convenience init(email: String, nick: String) {
        self.init()
        self.email = email
        self.nick = nick
    }
    
    func encode(with aCoder: NSCoder) {
        if let email = email { aCoder.encode(email, forKey: "email") }
        if let nick = nick { aCoder.encode(nick, forKey: "nick") }
    }
    
}

