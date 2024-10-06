//
//  Assignment1App.swift
//  Assignment1
//
//  Created by Raven G on 2024-09-27.
//

import SwiftUI

@main
struct Assignment1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
