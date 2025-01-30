//
//  Extensions.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftUI

//MARK: - Elements Color, Background 2 Color

extension Color {
    static let elementsColor = Color(.sRGB, red: 227/255, green: 255/255, blue: 255/255)
    static let backgroundCustomBlueColor = Color(.sRGB, red: 10/255, green: 45/255, blue: 80/255)
    static let customBlue = Color(.sRGB, red: 20/255, green: 120/255, blue: 150/255)
        
}

//MARK: - Background Gradient

extension LinearGradient {
    static let backgroundGradient = LinearGradient(colors: [Color(.sRGB, red: 10/255, green: 45/255, blue: 80/255), Color(.sRGB, red: 113/255, green: 201/255, blue: 206/255)], startPoint: .top, endPoint: .bottom)
}

//MARK: - MESH

