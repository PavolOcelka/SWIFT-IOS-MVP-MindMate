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
    let minScale: CGFloat = 0.5
    let maxScale: CGFloat = 0.7
    let phaseDuration: TimeInterval = 4.0

    var body: some View {
        ZStack {
            // Príjemný gradient ako pozadie
            LinearGradient.stressAndAnxietyCard.ignoresSafeArea()

            VStack {
                Spacer()
                
                // Animovaný kruh, ktorý znázorňuje dýchací cyklus
                ZStack {
                    Circle()
                        .fill(Color.purple.opacity(0.3))
                        .frame(width: 500, height: 500)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: phaseDuration), value: scale)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 200)
                    Text(isBreathing == false ? "" : actionText)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        
                }
                .shadow(radius: 10)
                
                Spacer()
                
                // Tlačidlo na spustenie cyklu box breathing
                if isBreathing == false {
                    Button(action: {
                        if !isBreathing {
                            isBreathing = true
                            startCycle()
                        }
                    }) {
                        Text("Start Breathing")
                            .font(.title.bold())
                            .padding()
                            .background(Color.purple.opacity(0.3))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding()
                } else {
                    Button(action: {
                        isBreathing = false
                    }) {
                        Text("Stop")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                
                }
        }
    }

    // Funkcia, ktorá spustí celý cyklus a opakuje ho
    func startCycle() {
        startInhalation {
            startHold {
                startExhalation {
                    if isBreathing {
                        startCycle() // opakuj cyklus
                    }
                }
            }
        }
    }

    // Fáza nádychu: zväčšenie kruhu + postupne rastúce vibrácie
    func startInhalation(completion: @escaping () -> Void) {
        withAnimation(.easeInOut(duration: phaseDuration)) {
            scale = maxScale
        }
        actionText = "Inhale"
        // Rozdelíme 4 sekundy na intervaly (napr. každých 0.5 sekundy)
        let interval: TimeInterval = 0.5
        let steps = Int(phaseDuration / interval)
        var currentStep = 0
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            let fraction = Double(currentStep) / Double(steps - 1)
            // Pri nádychu: fraction 0.0 → light, 1.0 → heavy
            let style: UIImpactFeedbackGenerator.FeedbackStyle = hapticStyle(for: fraction)
            triggerHapticFeedback(style: style)
            currentStep += 1
            if currentStep >= steps {
                timer.invalidate()
                completion()
            }
        }
    }

    // Fáza držania: udržiavame veľkosť, vibrácie konštantné (medium) každú sekundu
    func startHold(completion: @escaping () -> Void) {
        let interval: TimeInterval = 1.0
        let steps = Int(phaseDuration / interval)
        var currentStep = 0
        withAnimation {
            actionText = "Hold"
        }
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            triggerHapticFeedback(style: .medium)
            currentStep += 1
            if currentStep >= steps {
                timer.invalidate()
                completion()
            }
        }
    }

    // Fáza výdychu: zmenšenie kruhu + postupne klesajúce vibrácie
    func startExhalation(completion: @escaping () -> Void) {
        withAnimation(.easeInOut(duration: phaseDuration)) {
            scale = minScale
        }
        withAnimation {
            actionText = "Exhale"
        }
        let interval: TimeInterval = 0.5
        let steps = Int(phaseDuration / interval)
        var currentStep = 0
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            let fraction = Double(currentStep) / Double(steps - 1)
            // Pri výdychu chceme opačný priebeh: fraction 0.0 → heavy, 1.0 → light
            let style: UIImpactFeedbackGenerator.FeedbackStyle = hapticStyle(for: 1 - fraction)
            triggerHapticFeedback(style: style)
            currentStep += 1
            if currentStep >= steps {
                timer.invalidate()
                completion()
            }
        }
    }

    // Funkcia, ktorá na základe hodnoty fraction určí haptický štýl:
    // fraction < 0.33: light, < 0.66: medium, inak heavy.
    func hapticStyle(for fraction: Double) -> UIImpactFeedbackGenerator.FeedbackStyle {
        if fraction < 0.33 {
            return .light
        } else if fraction < 0.66 {
            return .medium
        } else {
            return .heavy
        }
    }

    // Vyvolanie haptickej odozvy s daným štýlom
    func triggerHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

#Preview {
    StressAnxietyView()
}
