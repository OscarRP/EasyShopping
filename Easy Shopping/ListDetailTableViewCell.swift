//
//  ListDetailTableViewCell.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 14/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class ListDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
