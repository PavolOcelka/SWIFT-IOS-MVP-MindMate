//
//  jounralLink.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 01/02/2025.
//

import SwiftUI

struct jounralLink: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue.ignoresSafeArea()
                
                NavigationLink(destination: MainView()) {
                    VStack(spacing: 0){
                        VStack {
                            HStack(alignment: .top){
                                Text("Journal New Entry NNDn NDndn")
                                    .multilineTextAlignment(.leading)
                                    .font(.largeTitle.bold())
                                    .foregroundStyle(Color.elementsColor)
                                Spacer()
                                Text("1.1.2025")
                                    .font(.title)
                                    .foregroundStyle(Color.elementsColor)
                            }
                            .padding(.top)
                            .padding(.horizontal)
                        }
                        
                        Text("Lorem")
                            .foregroundStyle(Color.elementsColor)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity ,maxHeight: 200)
                    .background(LinearGradient(colors: [
                        Color(.sRGB, red: 0/255, green: 180/255, blue: 219/255),
                        Color(.sRGB, red: 0/255, green: 131/255, blue: 176/255)
                    ], startPoint: .top, endPoint: .bottom))
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal)
                    .shadow(radius: 8)
                }
            }
        }
    }
}

#Preview {
    jounralLink()
}
