//
//  Journal.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import Foundation


struct Journals: Codable, Identifiable{
    var id: UUID = UUID()
    var date: Date = Date()
    var title: String = "Journal Entry"
    var content: String
    
}

var testJournal = Journals(title: "Test",content: "Hello World")

