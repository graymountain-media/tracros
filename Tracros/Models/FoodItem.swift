//
//  FoodItem.swift
//  Tracros
//
//  Created by Jake Gray on 8/12/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

import UIKit
import CoreData

extension FoodItem {
    convenience init(fromSearchItem item: SearchFoodItem, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        self.name = item.desc.name
        self.ndbno = item.desc.ndbno
        
        for nutrient in item.nutrients {
            switch nutrient.name{
            case "Total lipid (fat)":
                self.fat = Double(nutrient.value) ?? 0
            case "Cholesterol":
                self.cholesterol = Double(nutrient.value) ?? 0
            case "Sodium, Na":
                self.sodium = Double(nutrient.value) ?? 0
            case "Potassium, K":
                self.potassium = Double(nutrient.value) ?? 0
            case "Carbohydrate, by difference":
                self.carbs = Double(nutrient.value) ?? 0
            case "Fiber, total dietary":
                self.fiber = Double(nutrient.value) ?? 0
            case "Sugars, total":
                self.sugars = Double(nutrient.value) ?? 0
            case "Protein":
                self.protein = Double(nutrient.value) ?? 0
            case "Calcium, Ca":
                self.calcium = Double(nutrient.value) ?? 0
            case "Iron, Fe":
                self.iron = Double(nutrient.value) ?? 0
            default:
                continue
            }
        }
    }
}
