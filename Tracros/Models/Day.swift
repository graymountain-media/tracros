//
//  Day.swift
//  Tracros
//
//  Created by Jake Gray on 7/31/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class Day {
    let date: Date
    let meals: [Meal]
    
    init(date: Date) {
        self.date = date
        self.meals = []
    }
}
