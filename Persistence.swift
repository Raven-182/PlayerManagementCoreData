//
//  Persistence.swift
//  Assignment1
//
//  Created by Raven G on 2024-09-27.
//

import CoreData
import SwiftUI

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Entries(context: viewContext)
            newItem.name = "Raven"
            newItem.age = 21
            newItem.avatar = "Avatar 2"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Assignment1")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveContext(){
        let context = container.viewContext
        
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("error saving context")
            }
        }
    }
        
    func saveEntry(name : String, email : String, address : String, age: Int16, avatar: String)
        {
            let newEntry = Entries(context: container.viewContext)
            
            newEntry.id = UUID()
            newEntry.name = name
            newEntry.email = email
            newEntry.address = address
            newEntry.age = age
            newEntry.avatar = avatar
            
            saveContext()
            
        }
}
