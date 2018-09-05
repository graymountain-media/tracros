//
//  PlannedDayController.swift
//  Tracros
//
//  Created by Jake Gray on 8/21/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class PlannedDayController {
    static func createPlannnedDay(inPlan plan: Plan) {
        let _ = PlannedDay(plan: plan)
        
        saveData()
    }
    
    static func delete(plannnedDay: PlannedDay){
        plannnedDay.managedObjectContext?.delete(plannnedDay)
        
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
