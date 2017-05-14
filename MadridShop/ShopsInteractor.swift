//
//  ShopsInteractor.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

public protocol ShopsInteractor {
    func execute(completion:@escaping (Shops) -> Void)
    func execute(completion:@escaping (Shops) -> Void, onError: ErrorClosure?)
}
