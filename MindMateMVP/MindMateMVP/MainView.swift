//
//  ContentView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var user: User
    
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
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .foregroundStyle(Color.elementsColor)
                            .padding()
                        }
                        Spacer()
                    }
                    
                    
                    //MARK: - Quote Stack
                    VStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 0){
                            HStack {
                                Text("Quote")
                                    .font(.title.bold())
                                    .foregroundStyle(Color.elementsColor)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            NavigationLink(destination: QuickActionView()) {
                                VStack(alignment: .leading) {
                                    Text("")
                                }
                                .frame(maxWidth: .infinity, maxHeight: 80)
                                .background(Color(.sRGB, red: 10/255, green: 45/255, blue: 80/255))
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
                                
                                Text("1.1.2025")
                                    .font(.title2.bold())
                                    .foregroundStyle(Color.elementsColor)
                            }
                            .padding(.horizontal)
                            
                            NavigationLink(destination: JournalView()) {
                                VStack {
                                    Text("Content")
                                        .foregroundStyle(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    Text(user.journals.first?.content ?? "Write about your day into your journal!") // NEEDS TO BE CHANGEd to journal content
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
                                        
                                    CardView(title: "Sleep", description: CardsText.sleepDescription, imageResource: "stressCharacter",backgroundGradientCard: LinearGradient.sleepCard, destination: StressAnxietyView())
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
}

#Preview {
    MainView()
        .environmentObject(User())
}
