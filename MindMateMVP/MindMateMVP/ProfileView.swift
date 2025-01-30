//
//  ProfileView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 30/01/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var user: User
    
    @State private var name = ""
    @State private var selectedRole = "Student"
    
    private var roles = ["Student", "Parent", "Worker"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0){
                    
                    Text("About Me")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle.bold())
                        .foregroundColor(Color.elementsColor)
                        .padding(.horizontal)
                    
                    Form {
                        Section("Personal"){
                            TextField("Name", text: $name)
                            Picker("Role", selection: $selectedRole) {
                                ForEach(roles, id: \.self) { role in
                                    Text(role)
                                }
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                    
                    Text("\(user.totalSessions)")
                    
                    Button(action: {
                        
                    }) {
                        Text(user.name.isEmpty ? "Set Up" : "Save")
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    ProfileView()
        .environmentObject(User())
}
