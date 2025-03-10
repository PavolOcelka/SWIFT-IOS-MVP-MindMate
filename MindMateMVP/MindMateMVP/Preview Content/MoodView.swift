//
//  JournalView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftData
import SwiftUI

struct MoodView: View {
    
    @Environment(\.modelContext) var context
    @Query(sort: \MoodModel.date, order: .reverse) var moods: [MoodModel]
    
    @State private var color: LinearGradient = LinearGradient(colors: [
        Color(.sRGB, red: 0/255, green: 180/255, blue: 219/255),
        Color(.sRGB, red: 0/255, green: 131/255, blue: 176/255)
    ], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.customBlue.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Mood Tracking").font(.largeTitle.bold())
                        .foregroundStyle(Color.elementsColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    ScrollView {
                        ForEach(moods, id: \.self) { mood in
                            NavigationLink(destination: MoodDetailView(mood: mood)) {
                                VStack(spacing: 0){
                                    HStack(alignment: .top) {
                                        Text(mood.moodCategory)
                                            .multilineTextAlignment(.leading)
                                            .font(.title.bold())
                                            .foregroundStyle(Color.elementsColor)
                                        Spacer()
                                        Text(mood.date.formatted(date: .abbreviated, time: .omitted))
                                            .font(.title)
                                            .foregroundStyle(Color.elementsColor)
                                    }
                                    .padding(.top)
                                    .padding(.horizontal)
                                    
                                    Text(mood.content != "" ? mood.content : "No content yet")
                                        .foregroundStyle(Color.elementsColor)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .background(gradientForCategory(mood.moodCategory))
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
                    
                    Button(action: {addNewMood()}) {
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
    
    func addNewMood() {
        let newMood = MoodModel(date: .now, mood: "", content: "")
        context.insert(newMood)
        
        do {
            try context.save()
        } catch {
            print("Error when saving: \(error.localizedDescription)")
        }
    }
    
    func gradientForCategory(_ category: String) -> LinearGradient {
        switch category {
        // Happy
        case "Happy", "Joy", "Contentment", "Gratitude", "Pride", "Hope", "Love", "Relief":
            return LinearGradient(colors: [
                Color(.sRGB, red: 168/255, green: 224/255, blue: 99/255), // Bright Green
                Color(.sRGB, red: 86/255, green: 171/255, blue: 47/255)  // Golden Green
            ], startPoint: .top, endPoint: .bottom)
            
        // Sad
        case "Sad", "Sadness", "Loneliness", "Nostalgia", "Grief":
            return LinearGradient(colors: [
                Color(.sRGB, red: 0/255, green: 0/255, blue: 255/255),   // Blue
                Color(.sRGB, red: 0/255, green: 0/255, blue: 128/255)   // Dark Blue
            ], startPoint: .top, endPoint: .bottom)
            
        // Angry
        case "Angry", "Anger", "Frustration", "Irritation", "Rage":
            return LinearGradient(colors: [
                Color(.sRGB, red: 255/255, green: 0/255, blue: 0/255),  // Red
                Color(.sRGB, red: 128/255, green: 0/255, blue: 0/255)  // Dark Red
            ], startPoint: .top, endPoint: .bottom)
            
        // Anxious
        case "Anxious", "Anxiety", "Worry", "Overwhelm", "Panic":
            return LinearGradient(colors: [
                Color(.sRGB, red: 255/255, green: 165/255, blue: 0/255),   // Orange
                Color(.sRGB, red: 200/255, green: 100/255, blue: 0/255)   // Dark Orange
            ], startPoint: .top, endPoint: .bottom)
            
        // Confused
        case "Confused", "Confusion", "Doubt", "Indecision", "Disorientation":
            return LinearGradient(colors: [
                Color(.sRGB, red: 128/255, green: 128/255, blue: 128/255), // Gray
                Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255)     // Dark Gray
            ], startPoint: .top, endPoint: .bottom)
            
        // Fearful
        case "Fearful", "Fear", "Insecurity", "Dread", "Terror":
            return LinearGradient(colors: [
                Color(.sRGB, red: 128/255, green: 0/255, blue: 128/255),   // Purple
                Color(.sRGB, red: 75/255, green: 0/255, blue: 130/255)    // Indigo
            ], startPoint: .top, endPoint: .bottom)
            
        // Surprised
        case "Surprised", "Surprise", "Awe", "Amazement", "Shock":
            return LinearGradient(colors: [
                Color(.sRGB, red: 255/255, green: 105/255, blue: 180/255), // Pink
                Color(.sRGB, red: 255/255, green: 20/255, blue: 147/255)   // Deep Pink
            ], startPoint: .top, endPoint: .bottom)
            
        // Default
        default:
            return LinearGradient(colors: [
                Color(.sRGB, red: 0/255, green: 180/255, blue: 219/255),   // Default Blue
                Color(.sRGB, red: 0/255, green: 131/255, blue: 176/255)    // Darker Blue
            ], startPoint: .top, endPoint: .bottom)
        }
    }
    
}

#Preview {
    MoodView()
        .environmentObject(User())
}
