//
//  Meal.swift
//  Tracros
//
//  Created by Jake Gray on 7/31/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class Meal {
    let type: MealType
    let items: [DatabaseItem]
    
    init(type: MealType) {
        self.type = type
        self.items = []
    }
}

enum MealType {
    case breakfast
    case lunch
    case dinner
    case snacks
}
