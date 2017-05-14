//
//  typealiases.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

//MARK: - TypeAliasses
public typealias Shops = [Shop]
public typealias JSONObject = String
public typealias JSONDictionary = [String : JSONObject]
public typealias JSONArray = [JSONDictionary]
public typealias ErrorClosure = (Error) -> Void
public typealias EmptyClosure = () -> Void

//MARK: - Errors
enum JSONErrors : Error{
    case missingField(name:String)
    case incorrectValue(name: String, value: String)
    case emptyJSONObject
    case emptyJSONArray
}


//MARK: - Config
public let API_URL = "https://madrid-shops.com/json_new/getShops.php"
public let DATA_BASE = "MadridShop"
