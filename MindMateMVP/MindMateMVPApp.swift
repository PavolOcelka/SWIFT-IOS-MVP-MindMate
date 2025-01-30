//
//  MindMateMVPApp.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftUI

@main
struct MindMateMVPApp: App {
    
    @StateObject private var user =  User()
    @StateObject private var userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(user)
                .environmentObject(userSettings)
        }
    }
}
