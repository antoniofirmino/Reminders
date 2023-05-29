//
//  LembretesApp.swift
//  Lembretes
//
//  Created by Antonio Marcos on 22/05/23.
//

import SwiftUI

@main
struct LembretesApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


