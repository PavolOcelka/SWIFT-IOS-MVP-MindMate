//
//  JournalView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftUI

struct JournalView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.customBlue.edgesIgnoringSafeArea(.all)
                VStack {
                    List {
                        ForEach(user.journals) { journal in
                            Text(journal.title)
                                .foregroundStyle(.primary)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    
                    Button(action: {
                        user.addJournal(journal: Journals(title: "Test", content: "Testing Content"))
                    }) {
                        Text("Add journal")
                    }
                }
            }
        }
    }
}

#Preview {
    JournalView()
        .environmentObject(User())
}
