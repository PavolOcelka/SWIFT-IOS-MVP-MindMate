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
                    Text("Journals").font(.largeTitle.bold())
                        .foregroundStyle(Color.elementsColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    ScrollView {
                        ForEach($user.journals) { $journal in
                            NavigationLink(destination: JournalDetailView(journal: $journal)) {
                                VStack(spacing: 0){
                                    HStack(alignment: .top) {
                                        Text(journal.title)
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
                                    
                                    Text(journal.content)
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
                        .onDelete(perform: deleteJournal)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    
                    Button(action: {
                        user.addJournal(journal: Journals(title: "New Journal Entry", content: "Journal Content..."))
                        print(user.journals.first)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .foregroundStyle(Color.elementsColor)
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
