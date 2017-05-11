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
    let gpsLatitude: String
    let gpsLongitude: String
    let imageString: URL
    
    init(name: String, enDescription: String, esDescription: String, gpsLatitude: String, gpsLongitude: String, imageString: URL) {
        self.name = name
        self.enDescription = enDescription
        self.esDescription = esDescription
        self.gpsLatitude = gpsLatitude
        self.gpsLongitude = gpsLongitude
        self.imageString = imageString
    }
}
