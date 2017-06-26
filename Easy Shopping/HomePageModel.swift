	//
//  HomePageModel.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 29/5/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import Foundation
import UIKit
    
    struct HomePageModel {
        var title = ""
        var firstDescription = ""
        var secondDescription = ""
        var link = ""
        var image : UIImage
        
        init (title: String, firstDescription: String, secondDescription: String, link: String, image: UIImage) {
            self.title = title
            self.firstDescription = firstDescription
            self.secondDescription = secondDescription
            self.link = link
            self.image = image
        }

        
//        init (title: String, firstDescription: String, secondDescription: String, link: String) {
//            self.title = title
//            self.firstDescription = firstDescription
//            self.secondDescription = secondDescription
//            self.link = link
//            
//        }
        
        init (title: String, firstDescription: String, image: UIImage, link: String) {
            self.title = title
            self.firstDescription = firstDescription
            self.image = image
            self.link = link
        }
    }
