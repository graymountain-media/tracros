//
//  CoreDataStack.swift
//  Tracros
//
//  Created by Jake Gray on 8/12/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TracrosDataStack")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Error loaing from CoreData: \(error.localizedDescription)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    
}
