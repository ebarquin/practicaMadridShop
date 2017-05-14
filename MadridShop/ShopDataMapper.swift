//
//  ShopDataMapper.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 12/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import CoreData

extension Shop {
    func shopCoreData(context: NSManagedObjectContext) -> ShopCoreData {
        let s = ShopCoreData(context: context)
        
        s.name = self.name
        s.description_en = self.enDescription
        s.desription_es = self.esDescription
        s.gps_lat = self.gpsLatitude
        s.gps_lon = self.gpsLongitude
        
        return s
        
    }
    
//    func shopsData(shops: Shops) -> [ShopCoreData] {
//        let shopsData = [ShopCoreData]()
//        for shop in shops {
//            
//        }
//        return shopsData
//    }
}
