//
//  JSONProcessing.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit

//MARK: - Decodification
func decode(shop dict:JSONDictionary) throws -> Shop {
    //validate first
    // try validate(dictionary: dict)
    
    //extract from dict
    func extract(key: String) -> String {
        return dict[key]! as! String //We know it can´t be messing  because we validated first!
    }
    
    //parsing
    let name = extract(key: "name")
    let enDescription = extract(key:  "description_en")
    let esDescription = extract(key: "description_es")
    let imageString = URL(string: extract(key: "img")) ?? URL(string: "http://www.google.es")
    let address = extract(key: "address")
    //TODO: Convert long and lat in float
    let gpsLatitude = Double(extract(key: "gps_lat"))
    let gpsLongitude = Double(extract(key: "gps_lon"))
    
    return Shop(name: name, enDescription: enDescription, esDescription: esDescription, gpsLatitude: gpsLatitude ?? 0, gpsLongitude: gpsLongitude ?? 0, imageString: imageString!, address: address)
    
}
func decode(shop dict: JSONDictionary?) throws -> Shop{
    
    guard let d = dict else {
        throw JSONErrors.emptyJSONObject
    }
    return try decode(shop:d)
}


func decode(shops dicts: JSONArray) throws -> [Shop] {
    return try dicts.flatMap{
        try decode(shop:$0)
    }
}
func decode(shops dicts: JSONArray?) throws -> [Shop]{
    guard let ds = dicts else {
        throw JSONErrors.emptyJSONArray
    }
    return try decode(shops: ds)
}










//MARK: - Validation
// Validation should be kept waya from processing to
// insure the single responsability principle
// https://medium.com/swift-programming/why-swift-guard-should-be-avoided-484cfc2603c5#.bd8d7ad91
private
func validate(dictionary dict: JSONDictionary) throws{
    
    func isMissing() throws{
        for key in dict.keys{
            guard let value = dict[key] else{
                throw JSONErrors.missingField(name: key)
            }
            guard (value as! String).characters.count > 0  else {
                throw JSONErrors.incorrectValue(name: key, value: value as! String)
            }
        }
        
    }
    
    try isMissing()
    
}


//MARK: - Parsing
func parseCommaSeparated(string s: String)->[String]{
    
    return s.components(separatedBy: ",").map({ $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }).filter({ $0.characters.count > 0})
}

