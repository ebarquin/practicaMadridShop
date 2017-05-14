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

                let shop1 = Shop(name: "Cortefiel - Preciados",
                                 enDescription: "An extensive network of stores spread across four continents makes Cortefiel Group one of the leading European companies in the fashion industry.  Through its four chains -Cortefiel, Pedro del Hierro, Springfield and Women'secret-, the Group operates in 58 countries with 1,647 points of sale. ",
                                 esDescription: "Una extensa red de tiendas distribuidas por cuatro continentes convierte a Grupo Cortefiel en una de las principales compañías europeas del sector moda. A través de sus cuatro cadenas –Cortefiel, Pedro del Hierro, Springfield y Women’secret-, el Grupo está presente en 58 países con 1.647 puntos de venta.",
                                 gpsLatitude: 40.4180563,
                                 gpsLongitude: -3.7010172999999895,
                                 imageString: URL(string: "https://madrid-shops.com/media/shops/cortefiel-small.jpg")!)
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
