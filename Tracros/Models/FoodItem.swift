//
//  FoodItem.swift
//  Tracros
//
//  Created by Jake Gray on 7/27/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

struct FoodItem: Codable {
//    var fat, cholesterol, sodium, potassium, carbs, fiber, sugars, protein, vitA, vitC, calcium, iron : Double
//
//    init(nutrients: [String: Double]) {
//        self.fat = nutrients["fat"] ?? 0
//        self.cholesterol = nutrients["cholesterol"] ?? 0
//        self.sodium = nutrients["sodium"] ?? 0
//        self.potassium = nutrients["potassium"] ?? 0
//        self.carbs = nutrients["carbs"] ?? 0
//        self.fiber = nutrients["fiber"] ?? 0
//        self.sugars = nutrients["sugars"] ?? 0
//        self.protein = nutrients["protein"] ?? 0
//        self.vitA = nutrients["vitA"] ?? 0
//        self.vitC = nutrients["vitC"] ?? 0
//        self.calcium = nutrients["calcium"] ?? 0
//        self.iron = nutrients["iron"] ?? 0
//    }
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
