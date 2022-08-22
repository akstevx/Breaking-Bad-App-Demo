//
//  BreakingBadAppApp.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

@main
struct BreakingBadAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
