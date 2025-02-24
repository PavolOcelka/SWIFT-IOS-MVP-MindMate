//
//  FeelingsView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 23/02/2025.
//

import SwiftUI

struct FeelingsView: View {
    var body: some View {
        ZStack {
            Color.customBlue.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Find your feelings")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .font(.title.bold())
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    FeelingsView()
}
