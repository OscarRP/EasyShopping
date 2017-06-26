//
//  Offers.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 7/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import Foundation
import UIKit
import Parse

struct Offers {
    var offerID = ""
    var market = ""
    var title = ""
    var description = ""
    var image: PFFile?
    var link = ""
    var endDate = ""
    
    init(offerID: String, market: String, title: String, description: String, image: PFFile!, link: String, endDate: String) {
        self.offerID = offerID
        self.market = market
        self.title = title
        self.description = description
        self.image = image
        self.link = link
        self.endDate = endDate
    }
    
    init (pfObject: PFObject) {
        self.offerID = pfObject.objectId!
        self.market = pfObject["Supermercado"] as! String
        self.title = pfObject["Titulo"] as! String
        self.description = pfObject["Descripcion"] as! String
        self.image = pfObject["Imagen"] as? PFFile
        self.link = pfObject["Enlace"] as! String
        self.endDate = pfObject["FechaFin"] as! String
    }
    
    func toPfObject() -> PFObject {
        let offerObject = PFObject(className: "Offers")
        offerObject.objectId = offerID
        offerObject["Supermercado"] = market
        offerObject["Titulo"] = title
        offerObject["Descripcion"] = description
        offerObject["Imagen"] = image
        offerObject["Enlace"] = link
        offerObject["FechaFin"] = endDate
     
        return offerObject
    }
}
