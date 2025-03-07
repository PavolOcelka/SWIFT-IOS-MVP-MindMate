//
//  Stress&AnxietyView.swift
//  MindMateMVP
//
//  Created by Pavol Ocelka on 31/01/2025.
//

import SwiftUI

struct StressAnxietyView: View {
    @State private var scale: CGFloat = 0.5
    @State private var isBreathing = false
    @State private var actionText = "Inhale"
    @State private var breathingTask: Task<Void, Never>?
    
    let minScale: CGFloat = 0.5
    let maxScale: CGFloat = 0.7
    let phaseDuration: TimeInterval = 4.0
    
    var body: some View {
        ZStack {
          
            LinearGradient.stressAndAnxietyCard.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // animation
                ZStack {
                    Circle()
                        .fill(Color.purple.opacity(0.3))
                        .frame(width: 500, height: 500)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: phaseDuration), value: scale)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 200)
                    Text(isBreathing ? actionText : "")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    
                }
                .shadow(radius: 10)
                
                Spacer()
                
                // box breathing
                if !isBreathing {
                    Button(action: startBreathing) {
                        Text("Start Breathing")
                            .font(.title.bold())
                            .padding()
                            .background(Color.purple.opacity(0.3))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding()
                } else {
                    Button(action: stopBreathing) {
                        Text("Stop")
                            .font(.title.bold())
                            .padding()
                            .background(Color.purple.opacity(0.3))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                
            }
        }
    }
    
    private func startBreathing() {
        isBreathing = true
        breathingTask = Task { @MainActor in
            while !Task.isCancelled && isBreathing {
                // Inhale phase
                actionText = "Inhale"
                withAnimation(.easeInOut(duration: phaseDuration)) {
                    scale = maxScale
                }
                await performHapticSequence(increasing: true)
                guard isBreathing else { break }
                
                // Hold phase
                actionText = "Hold"
                await performHoldHaptics()
                guard isBreathing else { break }
                
                // Exhale phase
                actionText = "Exhale"
                withAnimation(.easeInOut(duration: phaseDuration)) {
                    scale = minScale
                }
                await performHapticSequence(increasing: false)
                guard isBreathing else { break }
            }
        }
    }
    
    private func stopBreathing() {
        isBreathing = false
        breathingTask?.cancel()
        breathingTask = nil
        
        withAnimation {
            scale = minScale
            actionText = "Inhale"
        }
    }
    
    private func performHapticSequence(increasing: Bool) async {
        let steps = Int(phaseDuration / 0.5)
        for step in 0..<steps {
            guard isBreathing else { return }
            let fraction = Double(step) / Double(steps - 1)
            let style = hapticStyle(for: increasing ? fraction : 1 - fraction)
            await triggerHapticFeedback(style: style)
            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        }
    }
    
    private func performHoldHaptics() async {
        let steps = Int(phaseDuration)
        for _ in 0..<steps {
            guard isBreathing else { return }
            await triggerHapticFeedback(style: .medium)
            try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        }
    }
    
    private func hapticStyle(for fraction: Double) -> UIImpactFeedbackGenerator.FeedbackStyle {
        if fraction < 0.33 {
            return .light
        } else if fraction < 0.66 {
            return .medium
        } else {
            return .heavy
        }
    }
    
    private func triggerHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) async {
        await MainActor.run {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.impactOccurred()
        }
    }
}

#Preview {
    StressAnxietyView()
}
