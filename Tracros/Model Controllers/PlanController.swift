//
//  PlanController.swift
//  Tracros
//
//  Created by Jake Gray on 8/21/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class PlanController {
    static func createPlan(withName name: String, type: PlanType, duration: Int) {
        let _ = Plan(name: name, type: type, duration: duration)
        
        saveData()
    }
    
    static func delete(plan: Plan){
        plan.managedObjectContext?.delete(plan)
        
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
