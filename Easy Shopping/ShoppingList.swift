//
//  ShoppingList.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 31/5/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import Foundation
import UIKit

class ShoppingList: NSObject, NSCoding {
    
    var name: String!
    var products: [Product]!
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.products = decoder.decodeObject(forKey: "products") as! [Product]
    }
    
    convenience init(name: String, products: [Product]) {
        self.init()
        self.name = name
        self.products = products
    }
    
    func encode(with aCoder: NSCoder) {
        if let name = name { aCoder.encode(name, forKey: "name") }
        if let products = products { aCoder.encode(products, forKey: "products") }
    }
}
