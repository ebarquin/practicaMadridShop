//
//  CoreDataManager.swift
//  CoreDataHelloWorld
//
//  Created by Diego Freniche Brito on 15/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import CoreData

public func persistentContainer(dbName: String, onError: ((NSError) -> Void)? = nil) -> NSPersistentContainer {
    let container = NSPersistentContainer(name: dbName)

    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError?,
           let onError = onError {
            onError(error)
        }
    })
    return container
}

public func saveContext(context: NSManagedObjectContext, onError: ErrorClosure? = nil) {
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            if let errorClosure = onError {
                errorClosure(error)
            }
        }
    }
}

public func saveContext(context: NSManagedObjectContext, onSuccess: EmptyClosure, onError: ErrorClosure? = nil) {
    if context.hasChanges {
        do {
            try context.save()
            onSuccess()
        } catch {
            if let errorClosure = onError {
                errorClosure(error)
            }
        }
    }
}

