//
//  JournalDetailView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 31/01/2025.
//

import SwiftUI

struct JournalDetailView: View {
    
    @Binding var journal: Journals
    @State private var fontSize: CGFloat = 17
    
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
                        Text(journal.date.formatted(date: .abbreviated, time: .omitted))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .foregroundStyle(Color.elementsColor)
                    }
                    TextEditor(text: $journal.content)
                        .frame(maxHeight: 400)
                        .scrollContentBackground(.hidden)
                        .padding()
                        .foregroundStyle(Color.elementsColor)
                        .font(.system(size: fontSize))
                    
                    Slider(
                        value: $fontSize,
                        in: 17...35
                    )
                    .padding()
                    .tint(.blue)
                    .frame(maxWidth: 200)
                    .background(Color.elementsColor)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var testJournal = Journals(title: "Sample Journal", content: "This is a test entry.")

    JournalDetailView(journal: $testJournal)
}
