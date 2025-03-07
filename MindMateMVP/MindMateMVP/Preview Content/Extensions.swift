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

//MARK: - Card gradients

extension LinearGradient {
    static let stressAndAnxietyCard = LinearGradient(colors: [Color(.sRGB, red: 95/255, green: 44/255, blue: 130/255), Color(.sRGB, red: 31/255, green: 28/255, blue: 44/255)], startPoint: .top, endPoint: .bottom)
    
    static let sleepCard = LinearGradient(colors: [Color(.sRGB, red: 146/255, green: 141/255, blue: 171/255), Color(.sRGB, red: 31/255, green: 28/255, blue: 44/255)], startPoint: .top, endPoint: .bottom)
}
//MARK: - MESH

//MARK: - DATE STrip time

extension Date {

    func stripTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }

}
