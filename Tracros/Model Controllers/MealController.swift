//
//  MealController.swift
//  Tracros
//
//  Created by Jake Gray on 8/21/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class MealController {
    static func createMeal(ofType type: String) {
        let _ = Meal(type: type)
        
        saveData()
    }
    
    static func delete(meal: Meal){
        meal.managedObjectContext?.delete(meal)
        
        saveData()
    }
    
    static func add(foodItem: FoodItem, toMeal meal: Meal) {
        
    }
    
    static private func saveData(){
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
}
