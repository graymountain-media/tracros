//
//  FoodItemController.swift
//  Tracros
//
//  Created by Jake Gray on 8/21/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class FoodItemController {
    static func createFoodItem(fromSearchItem item: SearchFoodItem) {
        let _ = FoodItem(fromSearchItem: item)
        
        saveData()
    }
    
    static func delete(foodItem: FoodItem){
        foodItem.managedObjectContext?.delete(foodItem)
        
        saveData()
    }
    
    static private func saveData(){
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
}
