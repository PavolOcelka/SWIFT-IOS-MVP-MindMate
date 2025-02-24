//
//  ContentView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftData
import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var user: User
    @Query(sort: \Journals.date, order: .reverse) private var journals: [Journals]
    @Query(sort: \MoodModel.date, order: .reverse) private var moods: [MoodModel]

    
    @State private var isTapped = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    //MARK: - Background
                    LinearGradient.backgroundGradient
                        .ignoresSafeArea()
                    
                    //MARK: - Profile
                    VStack {
                        HStack {
                            Text(user.name)
                            Spacer()
                            NavigationLink(destination: FeelingsView()) {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .foregroundStyle(Color.elementsColor)
                            .padding()
                        }
                        Spacer()
                    }
                    .hidden()
                    
                    
                    //MARK: - Quote Stack
                    VStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 0){
                            HStack {
                                NavigationLink(destination: MoodView()){
                                    Text("My Mood")
                                        .font(.title2.bold())
                                        .foregroundStyle(Color.elementsColor)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            NavigationLink(destination: MoodView()) {
                                VStack(alignment: .leading) {
                                    Text(moods.first?.date.formatted(date: .complete, time: .omitted) == Date.now.formatted(date: .complete, time: .omitted) ? moods.first?.moodCategory ?? "How I feel today?" : "How I feel today?")                                        .font(.title.bold())
                                        .foregroundStyle(moods.first?.date.formatted(date: .complete, time: .omitted) == Date.now.formatted(date: .complete, time: .omitted) ? Color.white : Color(.sRGB, red: 10/255, green: 45/255, blue: 80/255))
                                }
                                .frame(maxWidth: .infinity, maxHeight: 80)
                                .background(
                                            moods.first?.date.formatted(date: .complete, time: .omitted) == Date.now.formatted(date: .complete, time: .omitted) ?
                                            gradientForCategory(moods.first?.moodCategory ?? "") :
                                            LinearGradient(colors: [Color(.sRGB, red: 109/255, green: 213/255, blue: 250/255)], startPoint: .top, endPoint: .bottom))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding()
                            }
                            
                        }
                        
                        //MARK: - Journal Stack
                        
                        VStack(spacing: 0){
                            HStack(alignment: .firstTextBaseline){
                                Text("Journal")
                                    .font(.largeTitle.bold())
                                    .foregroundStyle(Color.elementsColor)
                                Spacer()
                                
                                Text(journals.first?.date.formatted(date: .abbreviated, time: .omitted) ?? Date.now.formatted(date: .abbreviated, time: .omitted))
                                    .font(.title2.bold())
                                    .foregroundStyle(Color.elementsColor)
                            }
                            .padding(.horizontal)
                            
                            NavigationLink(destination: JournalView()) {
                                VStack {
                                    Text(journals.first?.title.isEmpty == true ? "Journal Title" : journals.first?.title ?? "Journal Title")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    Text(journals.first?.content.isEmpty == true ? "Journal Content" : journals.first?.content ?? "Journal Content") // NEEDS TO BE CHANGEd to journal content
                                        .font(.subheadline)
                                        .foregroundColor(Color.elementsColor)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: 150)
                                .background(Color(.sRGB, red: 10/255, green: 45/255, blue: 80/255))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding()
                            }
                        }
                    }
                }
                .blur(radius: isTapped ? 30 : 0)
                .allowsHitTesting(!isTapped)
                
                //MARK: - Character
                
                GeometryReader { geometry in
                    ZStack {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) {
                                isTapped.toggle()
                            }
                        } label: {
                            Image("appcharacter")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .scaleEffect(isTapped ? 1.5 : 1.0)
                                .shadow(radius: isTapped ? 20 : 0)
                        }
                        .position(
                            x: geometry.size.width / 2,
                            y: geometry.size.height * 0.3
                        )
                        
                        //MARK: - Buttons under character
                        
                        if isTapped {
                            VStack() {
                                Spacer()
                                TabView{
                                        CardView(title: "Stress & Anxiety", description: CardsText.stressAndAnxietyDescription, imageResource: "stressCharacter", destination: StressAnxietyView())
                                    CardView(title: "Sleep", description: CardsText.sleepDescription, imageResource: "stressCharacter",backgroundGradientCard: LinearGradient.sleepCard, destination: SleepView())
                                }
                                .tabViewStyle(.page)
                                
                                Text("Tap to start")
                                    .foregroundStyle(Color.elementsColor)
                                Spacer()
                            }
                            .padding(.top, geometry.size.height * 0.4)
                        }
                    }
                }
            }
        }
    }
    
    func gradientForCategory(_ category: String) -> LinearGradient {
        switch category {
        case "Happy":
            return LinearGradient(colors: [
                Color(.sRGB, red: 168/255, green: 224/255, blue: 99/255), // Bright Geen
                Color(.sRGB, red: 86/255, green: 171/255, blue: 47/255)  // Golden Green
            ], startPoint: .top, endPoint: .bottom)
            
        case "Sad":
            return LinearGradient(colors: [
                Color(.sRGB, red: 0/255, green: 0/255, blue: 255/255),   // Blue
                Color(.sRGB, red: 0/255, green: 0/255, blue: 128/255)   // Dark Blue
            ], startPoint: .top, endPoint: .bottom)
            
        case "Angry":
            return LinearGradient(colors: [
                Color(.sRGB, red: 255/255, green: 0/255, blue: 0/255),  // Red
                Color(.sRGB, red: 128/255, green: 0/255, blue: 0/255)    // Dark Red
            ], startPoint: .top, endPoint: .bottom)
            
        case "Surprised":
            return LinearGradient(colors: [
                Color(.sRGB, red: 255/255, green: 105/255, blue: 180/255), // Pink
                Color(.sRGB, red: 255/255, green: 20/255, blue: 147/255)  // Deep Pink
            ], startPoint: .top, endPoint: .bottom)
            
        case "Confused":
            return LinearGradient(colors: [
                Color(.sRGB, red: 128/255, green: 128/255, blue: 128/255), // Gray
                Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255)     // Dark Gray
            ], startPoint: .top, endPoint: .bottom)
            
        case "Fearful":
            return LinearGradient(colors: [
                Color(.sRGB, red: 128/255, green: 0/255, blue: 128/255),   // Purple
                Color(.sRGB, red: 75/255, green: 0/255, blue: 130/255)      // Indigo
            ], startPoint: .top, endPoint: .bottom)
            
        case "Anxious":
            return LinearGradient(colors: [
                Color(.sRGB, red: 255/255, green: 165/255, blue: 0/255),   // Orange
                Color(.sRGB, red: 200/255, green: 100/255, blue: 0/255)     // Dark Orange
            ], startPoint: .top, endPoint: .bottom)
            
        default:
            return LinearGradient(colors: [
                Color(.sRGB, red: 0/255, green: 180/255, blue: 219/255),   // Default Blue
                Color(.sRGB, red: 0/255, green: 131/255, blue: 176/255)     // Darker Blue
            ], startPoint: .top, endPoint: .bottom)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(User())
}
