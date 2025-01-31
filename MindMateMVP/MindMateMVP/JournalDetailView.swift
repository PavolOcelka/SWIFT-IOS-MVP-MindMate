//
//  JournalDetailView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 31/01/2025.
//

import SwiftUI

struct JournalDetailView: View {
    
    @Binding var journal: Journals
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue.ignoresSafeArea()
                VStack {
                    VStack {
                        TextField("journal title", text: $journal.title)
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(Color.elementsColor)
                            .padding(.horizontal)
                        Spacer()
                    }
                    TextEditor(text: $journal.content)
                        
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var testJournal = Journals(title: "Sample Journal", content: "This is a test entry.")

    JournalDetailView(journal: $testJournal)
}
