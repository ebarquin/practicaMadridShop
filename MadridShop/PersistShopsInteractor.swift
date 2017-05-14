//
//  PersistShopsInteractor.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 12/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

public protocol PersistShopsInteractor {
    func execute(shops: Shops, completion:@escaping([ShopCoreData]) -> Void)
    func execute(shops: Shops, completion:@escaping([ShopCoreData]) -> Void, onError: ErrorClosure?)
}
