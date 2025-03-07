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
    
    let container: ModelContainer = {
            do {
                let schema = Schema([Journals.self, MoodModel.self])
                return try ModelContainer(for: schema, configurations: [])
            } catch {
                fatalError("Error creating ModelContainer:\(error.localizedDescription)")
            }
        }()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(user)
                .modelContainer(container)
                .colorScheme(.light)
        }
    }
}
