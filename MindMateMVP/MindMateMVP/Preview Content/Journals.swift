//
//  Journal.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import Foundation
import SwiftData

@Model
class Journals {
    var date: Date = Date()
    var title: String = "Journal Entry"
    var content: String = ""
    
    init(date: Date, title: String, content: String) {
        self.date = date
        self.title = title
        self.content = content
    }
}


