//
//  PlannedDay.swift
//  Tracros
//
//  Created by Jake Gray on 7/31/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit
import CoreData

extension PlannedDay {
    convenience init(plan: Plan, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.plan = plan
        self.number = Int16((plan.days?.count)! + 1)
        self.meals = []
    }
}

