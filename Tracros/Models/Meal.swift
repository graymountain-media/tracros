//
//  Meal.swift
//  Tracros
//
//  Created by Jake Gray on 7/31/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit
import CoreData

extension Meal {
    convenience init(type: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.type = type
        self.items = []
    }
}
