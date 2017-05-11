//
//  Shop.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

public class Shop {
    let name: String
    let enDescription: String
    let esDescription: String
    let gpsLatitude: Double
    let gpsLongitude: Double
    let imageString: String
    
    init(name: String, enDescription: String, esDescription: String, gpsLatitude: Double, gpsLongitude: Double, imageString: String) {
        self.name = name
        self.enDescription = enDescription
        self.esDescription = esDescription
        self.gpsLatitude = gpsLatitude
        self.gpsLongitude = gpsLongitude
        self.imageString = imageString
    }
}
