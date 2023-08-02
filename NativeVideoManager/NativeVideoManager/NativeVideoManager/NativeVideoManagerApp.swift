//
//  NativeVideoManagerApp.swift
//  NativeVideoManager
//
//  Created by Md. Abul Kashem on 2/8/23.
//

import SwiftUI

@main
struct NativeVideoManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
