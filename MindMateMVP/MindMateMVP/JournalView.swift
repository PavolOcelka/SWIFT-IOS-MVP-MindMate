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
                        ForEach($user.journals) { $journal in
                            NavigationLink(destination: JournalDetailView(journal: $journal)) {
                                VStack(alignment: .leading) {
                                    Text(journal.title)
                                        .font(.headline)
                                    Text(journal.content)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(5)
                            }
                        }
                        .onDelete(perform: deleteJournal)
                    }
                    .scrollContentBackground(.hidden)
                    
                    Button(action: {
                        user.addJournal(journal: Journals(title: "Test", content: "Testing Content"))
                        user.addJournal(journal: Journals(title: "Test2", content: "Testing Content2"))
                        print(user.journals)
                    }) {
                        Text("Add journal")
                    }
                }
            }
        }
    }
    
    func deleteJournal(at offsets: IndexSet){
        user.journals.remove(atOffsets: offsets)
    }
}

#Preview {
    JournalView()
        .environmentObject(User())
}
