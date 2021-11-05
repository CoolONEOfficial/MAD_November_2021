//
//  WordsFactoryApp.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI

@main
struct WordsFactoryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
