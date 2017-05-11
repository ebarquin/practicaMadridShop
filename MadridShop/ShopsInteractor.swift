//
//  ShopsInteractor.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

public class ShopsInteractor {
    
    let manager: ShopsAPIManager
    public init(manager: ShopsAPIManager) {
        self.manager = manager
    }
    
    public func execute(completion:@escaping (Shops) -> Void) {
        execute(completion: completion, onError: nil)
        
    }
    
    public func execute(completion:@escaping (Shops) -> Void, onError: ErrorClosure? = nil) {
        manager.downloadShops(completion: { (shops) in
            completion(shops)
        }) { (error: Error) in
            if let errorClosure = onError {
                errorClosure(error)
            }
        }
        
    }
}
