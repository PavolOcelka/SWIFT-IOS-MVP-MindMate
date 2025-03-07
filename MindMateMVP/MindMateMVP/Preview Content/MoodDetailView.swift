//
//  MoodDetailView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 20/02/2025.
//

import SwiftUI
struct MoodDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var fontSize: CGFloat = 17
    @Bindable var mood: MoodModel
    
    var moodsCategory = [
        // Happy
        "Happy", "Joy", "Contentment", "Gratitude", "Pride", "Hope", "Love", "Relief",
        // Sad
        "Sad", "Sadness", "Loneliness", "Nostalgia", "Grief",
        // Angry
        "Angry", "Anger", "Frustration", "Irritation", "Rage",
        // Anxious
        "Anxious", "Anxiety", "Worry", "Overwhelm", "Panic",
        // Confused
        "Confused", "Confusion", "Doubt", "Indecision", "Disorientation",
        // Fearful
        "Fearful", "Fear", "Insecurity", "Dread", "Terror",
        // Surprised
        "Surprised", "Surprise", "Awe", "Amazement", "Shock"
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        HStack {
                            TextField("Title", text: $mood.mood)
                                .font(.largeTitle.bold())
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.elementsColor)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                            NavigationLink(destination: FeelingsView()) {
                                Image(systemName: "text.book.closed.fill")
                                    .resizable()
                                    .frame(width: 20, height: 25)
                            }
                            .foregroundStyle(Color.elementsColor)
                            .padding()
                            Button(action: {
                                deleteMood()
                            }){
                                Image(systemName: "trash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundStyle(Color.elementsColor)
                            }
                        }
                        .padding(.horizontal)
                        
                        Text(mood.date.formatted(date: .abbreviated, time: .omitted))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .foregroundStyle(Color.elementsColor)
                        
                    }
                    Form {
                        Picker("Mood", selection: $mood.moodCategory) {
                            ForEach(moodsCategory, id: \.self) { category in
                                Text(category)
                            }
                        }
                    }
                    .frame(height: 80)
                    .scrollContentBackground(.hidden)
                    
                    
                    PlaceholderTextEditor(text: $mood.content,
                                          placeholder: "Describe your mood, what happend, why do i feel how i feel?...")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .frame(maxHeight: 400)
                    .scrollContentBackground(.hidden)
                    .padding(.horizontal)
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
    
    func deleteMood() {
        context.delete(mood)
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
    MoodDetailView(mood: MoodModel(date: .now, mood: "Happy", content: "content mood", moodCategory: "Happy"))
}
