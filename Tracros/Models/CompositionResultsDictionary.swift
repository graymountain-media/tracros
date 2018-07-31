//
//  CompositionResultsDictionary.swift
//  Tracros
//
//  Created by Jake Gray on 7/30/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

struct CompositionResultsDictionary: Codable {
    let foods: [FoodResults]
    
   
}
struct FoodResults: Codable {
    let food: FoodItem
}
