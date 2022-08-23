//
//  BreakingBadAppApp.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

@main
struct BreakingBadAppApp: App {
//    let persistenceController = PersistenceController.shared
    let homeViewModel = HomeViewModel()
    let quoteViewModel = QuoteViewModel()
    let deathViewModel = DeathViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeViewModel)
                .environmentObject(quoteViewModel)
                .environmentObject(deathViewModel)

//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
