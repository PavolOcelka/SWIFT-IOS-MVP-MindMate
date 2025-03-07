//
//  JournalView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftData
import SwiftUI

struct JournalView: View {
    
    @Environment(\.modelContext) var context
    @Query(sort: \Journals.date, order: .reverse) var journals: [Journals]
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.customBlue.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Journals").font(.largeTitle.bold())
                        .foregroundStyle(Color.elementsColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    ScrollView {
                        ForEach(journals) { journal in
                            NavigationLink(destination: JournalDetailView(journal: journal)) {
                                VStack(spacing: 0){
                                    HStack(alignment: .top) {
                                        Text(journal.title != "" ? journal.title : "New Journal Entry")
                                            .multilineTextAlignment(.leading)
                                            .font(.title.bold())
                                            .foregroundStyle(Color.elementsColor)
                                        Spacer()
                                        Text(journal.date.formatted(date: .abbreviated, time: .omitted))
                                            .font(.title)
                                            .foregroundStyle(Color.elementsColor)
                                    }
                                    .padding(.top)
                                    .padding(.horizontal)
                                    
                                    Text(journal.content != "" ? journal.content : "No content yet")
                                        .foregroundStyle(Color.elementsColor)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .background(LinearGradient(colors: [
                                    Color(.sRGB, red: 0/255, green: 180/255, blue: 219/255),
                                    Color(.sRGB, red: 0/255, green: 131/255, blue: 176/255)
                                ], startPoint: .top, endPoint: .bottom))
                                .clipShape(.rect(cornerRadius: 20))
                                .padding(.horizontal)
                                .shadow(radius: 8)
                            }
                            .buttonStyle(.plain)
                            .background(.clear)
                            
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    
                    Button(action: {
                        let newJournal = Journals(date: .now, title: "", content: "")
                        context.insert(newJournal)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Error when saving: \(error.localizedDescription)")
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .foregroundStyle(Color.elementsColor)
                    }
                    .padding(.bottom, 16)
                }
            }
        }
    }
    
}

#Preview {
    JournalView()
        .environmentObject(User())
}

/*NavigationLink(destination: JournalDetailView(journal: $journal)) {
    VStack(alignment: .leading) {
        Text(journal.title)
            .font(.headline)
        Text(journal.content)
            .font(.subheadline)
            .foregroundColor(.gray)
        Text(journal.date.formatted(date: .abbreviated, time: .omitted))
    }
    .padding(5)
} */
