//
//  Build_OverApp.swift
//  Shared
//
//  Created by Dave Agyakwa on 12/01/2022.
//

import SwiftUI

@main
struct Build_OverApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
