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
    
    var moodsCategory = ["Happy", "Sad", "Angry", "Surprised", "Confused", "Fearful","Anxious"]
    
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
                                .foregroundStyle(Color.elementsColor)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
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
                    .frame(height: 100)
                    .scrollContentBackground(.hidden)
                    
                    
                    PlaceholderTextEditor(text: $mood.content,
                                          placeholder: "Describe your mood, what happend, why do i feel how i feel?...")
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
