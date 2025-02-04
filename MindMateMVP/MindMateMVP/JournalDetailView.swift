//
//  JournalDetailView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 31/01/2025.
//

import SwiftUI
import SwiftData

struct JournalDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var fontSize: CGFloat = 17
    @Bindable var journal: Journals
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        HStack {
                            TextField("Journal title", text: $journal.title)
                                .font(.largeTitle.bold())
                                .foregroundStyle(Color.elementsColor)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                            Button(action: {
                                deleteJournal()
                            }){
                                Image(systemName: "trash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundStyle(Color.elementsColor)
                            }
                        }
                        .padding(.horizontal)
                        
                        Text(journal.date.formatted(date: .abbreviated, time: .omitted))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .foregroundStyle(Color.elementsColor)
                    }
                    
                    PlaceholderTextEditor(text: $journal.content,
                                          placeholder: "How do I feel today? What happened today? Is there something I need to note down?")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
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
    
    func deleteJournal() {
        context.delete(journal)
        dismiss()
    }
    
    struct PlaceholderTextEditor: View {
        @Binding var text: String
        let placeholder: String
        
        var body: some View {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                        .padding(.leading, 5)
                }
                TextEditor(text: $text)
                    .padding(4)
            }
        }
    }
}

#Preview {
    JournalDetailView(journal: Journals(date: .now, title: "Test", content: "Test"))
}


