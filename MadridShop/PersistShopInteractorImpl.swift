//
//  PersistShopInteractorImpl.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 12/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import CoreData

public class PersistShopsInteractorImpl: PersistShopsInteractor {
    
    let context: NSManagedObjectContext
    
    init(context:NSManagedObjectContext){
        self.context = context
    }
    
    public func execute(shops: Shops, completion:@escaping([ShopCoreData]) -> Void) {
        
    }
    public func execute(shops: Shops, completion:@escaping([ShopCoreData]) -> Void, onError: ErrorClosure?) {
        var shopsData = [ShopCoreData]()
        shops.forEach { (shop:Shop) in
            let s = shop.shopCoreData(context: self.context)
            shopsData.append(s)
            print(shopsData)
        }
        
        saveContext(context: context, onSuccess: { 
            completion(shopsData)
            UserDefaults.standard.set(true, forKey: "DataDownloaded")
            
        }) { (error: Error) in
            if let ErrorClosure = onError {
                ErrorClosure(error)
            }
        }
        
    }
}
