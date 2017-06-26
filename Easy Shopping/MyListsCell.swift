//
//  MyListsCell.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 31/5/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class MyListsCell: UITableViewCell {
    
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var firstItem: UILabel!
    @IBOutlet weak var secondItem: UILabel!
    @IBOutlet weak var thirdItem: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
