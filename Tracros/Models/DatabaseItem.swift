//
//  FoodItem.swift
//  Tracros
//
//  Created by Jake Gray on 7/27/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

struct DatabaseItem: Codable {
    let desc: Description
    let nutrients: [Nutrient]
}

struct Description: Codable {
    let ndbno: String
    let name: String
}

struct Nutrient: Codable {
    let id: String
    let name: String
    let unit: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case id = "nutrient_id"
        case name = "name"
        case unit = "unit"
        case value = "value"
    }
}
