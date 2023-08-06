//
//  AguaAppMX.swift
//  aguaApp MX
//
//  Created by Eric Rojas Pech on 16/11/22.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
