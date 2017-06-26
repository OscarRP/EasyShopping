//
//  Product.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 31/5/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import Foundation

class Product: NSObject, NSCoding {
    
    var productName: String!
    var quantity: String?
    var price: Double?
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.productName = decoder.decodeObject(forKey: "productName") as! String
        self.quantity = decoder.decodeObject(forKey: "quantity") as? String
    }
    
    convenience init(productName: String, quantity: String) {
        self.init()
        self.productName = productName
        self.quantity = quantity
    }
    
    func encode(with aCoder: NSCoder) {
        if let productName = productName { aCoder.encode(productName, forKey: "productName") }
        if let quantity = quantity { aCoder.encode(quantity, forKey: "quantity") }
    }

}


//struct Product {
//    
//    var productName = ""
//    var quantity = 0
//    var price = 0.0
//    
//    
//    init (productName: String, quantity: Int) {
//        self.productName = productName
//        self.quantity = quantity
//    }
//    
//}
