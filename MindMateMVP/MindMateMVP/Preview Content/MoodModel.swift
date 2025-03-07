//
//  MoodModel.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 20/02/2025.
//


import Foundation
import SwiftData

@Model
class MoodModel {
    var date: Date = Date()
    var mood: String = ""
    var content: String = ""
    var moodCategory: String = ""
    
    init(date: Date, mood: String, content: String, moodCategory: String = "Normal") {
        self.date = date
        self.mood = mood
        self.content = content
        self.moodCategory = moodCategory
    }
}
