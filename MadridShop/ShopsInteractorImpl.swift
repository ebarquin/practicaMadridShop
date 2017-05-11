//
//  ShopsInteractorImpl.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

public class ShopsInteractorImpl: ShopsInteractor {
    
    let shopsAPIManager: ShopsAPIManager
    public init(shopsAPIManager: ShopsAPIManager) {
        self.shopsAPIManager = shopsAPIManager
    }
    
    public func execute(completion:@escaping (Shops) -> Void) {
        execute(completion: completion, onError: nil)
        
    }
    
    public func execute(completion:@escaping (Shops) -> Void, onError: ErrorClosure? = nil) {
        shopsAPIManager.downloadShops(completion: { (shops) in
            completion(shops)
        }) { (error: Error) in
            if let errorClosure = onError {
                errorClosure(error)
            }
        }
        
    }
}
