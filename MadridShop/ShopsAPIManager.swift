//
//  ShopsAPIManager.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

public class ShopsAPIManager {
    
    public func downloadShops(completion: (Shops) -> Void){
        downloadShops(completion: completion, onError: nil)
    }
    
    public func downloadShops(completion: (Shops) -> Void, onError: ErrorClosure? = nil) {
        
        let urlString = API_URL
        if let url = URL(string: urlString) {
            do {
//                let data = try Data(contentsOf: url)
//                let jsonDicts = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSONArray
//                let shops = try decode(shops: jsonDicts)

                let shop1 = Shop(name: "", enDescription: "", esDescription: "", gpsLatitude: "", gpsLongitude: "", imageString: URL(string: "http://www.google.com")!)
                let shops: [Shop] = [shop1]
                completion(shops)
            } catch {
                if let errorClosure = onError {
                    errorClosure(error)
                }
            }
            
        }
        
        DispatchQueue.global().async {
        }
    }
}
