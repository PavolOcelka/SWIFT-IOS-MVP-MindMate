//
//  SleepView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 20/02/2025.
//

import SwiftUI

struct SleepView: View {
    @State private var wakeUpTime = Date()
    @State private var idealBedtimes: [Date] = []
    @State private var showingSheet = false
    @State private var showingTipsSheet = false
    @State private var hasSelectedTime = false
    
    var body: some View {
        ZStack {
            LinearGradient.sleepCard.ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // Sleep Calculator
                VStack(spacing: 15) {
                    Text("Sleep Calculator")
                        .font(.title.bold())
                        .foregroundStyle(Color.white)
                    
                    Text("Enter the time you want to wake up, to get best times to go to sleep.")
                        .font(.subheadline)
                        .foregroundStyle(Color.white.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    DatePicker("Wake Up Time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()
                        .foregroundStyle(.black)
                        .background(Color(.white))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Button {
                        if hasSelectedTime {
                            calculateBedtimes()
                            showingSheet = true
                        }
                    } label: {
                        Text("Calculate Bedtimes")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .padding()
                            .frame(width: 250)
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
                .padding()
                .cornerRadius(10)
                .shadow(radius: 5)
                
                Spacer()
                
                Button {
                    showingTipsSheet = true
                } label: {
                    Text("Sleep Tips")
                        .font(.title2.bold())
                        .foregroundStyle(Color.white.opacity(0.5))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
            }
            .padding()
            
        }
        .sheet(isPresented: $showingSheet) {
            BedtimesSheet(idealBedtimes: idealBedtimes)
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $showingTipsSheet) {
            SleepTipsSheet()
                .presentationDetents([.large])
        }
        .onChange(of: wakeUpTime) {
            hasSelectedTime = true
        }
    }
    
    private func calculateBedtimes() {
        let calendar = Calendar.current
        let sleepCycles = [6, 7.5, 9]
        idealBedtimes = sleepCycles.map {
            calendar.date(byAdding: .hour, value: -Int($0), to: wakeUpTime) ?? wakeUpTime
        }
    }
}

struct SleepTipsSheet: View {
    var body: some View {
        ZStack {
            LinearGradient.sleepCard.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Sleep Tips")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("• Avoid caffeine 6 hours before bed.")
                    Text("• Keep your bedroom dark and cool.")
                    Text("• Stick to a consistent sleep schedule.")
                    Text("• Limit screen time before bed.")
                    Text("• Try relaxation techniques like deep breathing.")
                }
                .font(.title3)
                .foregroundStyle(.white)
                .padding()
                
                Spacer()
            }
            .padding(.top, 40)
            .overlay(alignment: .topTrailing) {
                Button {
                    // Dismiss action
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding()
            }
        }
    }
}


struct BedtimesSheet: View {
    let idealBedtimes: [Date]
    
    var body: some View {
        ZStack {
            LinearGradient.sleepCard.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Ideal Bedtimes")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                if idealBedtimes.isEmpty {
                    Text("Adjust wake-up time first")
                        .foregroundStyle(.white.opacity(0.7))
                } else {
                    ForEach(idealBedtimes, id: \.self) { bedtime in
                        Text(bedtime.formatted(date: .omitted, time: .shortened))
                            .frame(maxWidth: 300)
                            .font(.title.bold())
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    SleepView()
}

