//
//  BiometricsAppApp.swift
//  BiometricsApp
//
//  Created by Antonella Mariel Lesta on 17/04/2022.
//

import SwiftUI

@main
struct BiometricsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
