//
//  TaroterMacOSApp.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 24/12/2021.
//

import SwiftUI

@main
struct TaroterMacOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .navigationTitle("Taroter")
                .frame(minWidth: 640, minHeight: 400)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
