//
//  ShopsAPIManager.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

public class ShopsAPIManager {
    
    public func downloadShops(completion: @escaping (Shops) -> Void){
        downloadShops(completion: completion, onError: nil)
    }
    
    public func downloadShops(completion: @escaping (Shops) -> Void, onError: ErrorClosure? = nil) {
        
        let urlString = API_URL
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
                do {
                    if let data = data {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSONDictionary
                        let shopJson = json?["result"] as! JSONArray
                        let shops = try decode(shops: shopJson)
                        completion(shops)
                    }
                    
                } catch {
                    if let errorClosure = onError {
                        errorClosure(error)
                    }
                }

            })
         
            task.resume()
            
        }
        
        DispatchQueue.global().async {
        }
    }
}
