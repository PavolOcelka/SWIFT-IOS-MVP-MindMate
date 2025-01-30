//
//  User.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import Foundation

class User: ObservableObject {
    
    //MARK: - Personal User Info
    
    var name: String = ""
    var role: String = ""
    
    private(set) var totalSessions: Int = 0
    
    func increaseTotalSessions() {
        totalSessions += 1
    }
    
    
            
    //MARK: - Journal Settings
    
    var journals: [Journals] = []
    
    private(set) var journalStreak: Int = 0
    
    func increaseJournalStreak() {
        journalStreak += 1
    }
    
    func addJournal(journal: Journals) {
        journals.insert(journal, at: 0)
    }
    
    
}
