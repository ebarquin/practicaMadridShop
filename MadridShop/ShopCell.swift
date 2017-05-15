//
//  ShopCell.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 15/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit

class ShopCell: UITableViewCell {
    @IBOutlet weak var shopAddress: UILabel!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
