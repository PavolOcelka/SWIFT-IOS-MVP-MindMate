//
//  MindMateMVPApp.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftData
import SwiftUI

@main
struct MindMateMVPApp: App {
    
    @StateObject private var user =  User()
    @StateObject private var userSettings = UserSettings()
    
    let container: ModelContainer = {
            do {
                let schema = Schema([Journals.self])
                return try ModelContainer(for: schema, configurations: [])
            } catch {
                fatalError("Error creating ModelContainer:\(error.localizedDescription)")
            }
        }()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(user)
                .environmentObject(userSettings)
                .modelContainer(container)
        }
    }
}
