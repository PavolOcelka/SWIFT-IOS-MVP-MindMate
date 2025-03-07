//
//  CardView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 31/01/2025.
//

import SwiftUI

struct CardView<Destination: View>: View {
    
    var title: String = "Stress & Anxiety"
    var description: String = """
You are in control. Take a deep breath. A little pause can make a big difference.
"""
    var imageResource: String = "stressCharacter"
    var backgroundGradientCard: LinearGradient = LinearGradient.stressAndAnxietyCard
    var destination : Destination

    var body: some View {
        
        NavigationLink(destination: destination){
            VStack {
                VStack {
                    HStack {
                        Text(title)
                            .multilineTextAlignment(.leading)
                            .font(.largeTitle.bold())
                            .foregroundStyle(Color.elementsColor)
                        Spacer()
                        
                        Image(imageResource)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    Text(description)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .foregroundStyle(Color.elementsColor)
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .frame(width: 300, height: 250)
            .background(backgroundGradientCard)
            
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 10)
        }
    }
        

    }


#Preview {
    CardView(destination: StressAnxietyView())
}
