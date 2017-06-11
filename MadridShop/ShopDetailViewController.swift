//
//  ShopDetailViewController.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 16/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit
import CoreData

class ShopDetailViewController: UIViewController {
    

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopAddress: UILabel!
    @IBOutlet weak var shopDescription: UILabel!
    
    
    var context: NSManagedObjectContext? = nil
    var shop: ShopCoreData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        shopName.text = shop.name
        shopAddress.text = shop.address
        shopDescription.text = shop.description_en
        
        if  let imageData = UIImage(data: shop.image as! Data) {
            shopImage.image = imageData
        }

    }
}
