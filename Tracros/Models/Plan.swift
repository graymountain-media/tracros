//
//  Plan.swift
//  Tracros
//
//  Created by Jake Gray on 8/12/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit
import CoreData

extension Plan {
    convenience init(name: String, type: PlanType, duration: Int, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.days = []
        self.type = type.rawValue
        self.duration = Int16(duration)
    }
}
