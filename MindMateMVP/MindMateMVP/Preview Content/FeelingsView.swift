
import SwiftUI

struct FeelingsView: View {
    let feelings: [(name: String, description: String)] = [
        ("Happy", "A general feeling of well-being, positivity, and satisfaction"),
        ("Joy", "A strong, uplifting feeling of happiness and delight, often spontaneous"),
        ("Contentment", "A sense of peaceful satisfaction, often from achieving balance or comfort"),
        ("Gratitude", "A thankful feeling, appreciating what you have or the kindness you’ve received"),
        ("Pride", "A sense of accomplishment and self-worth derived from your achievements"),
        ("Hope", "A feeling of optimism and positive expectation for the future"),
        ("Love", "A deep and caring affection for someone or something, often creating a sense of connection"),
        ("Relief", "A feeling of release from stress, worry, or a challenging situation"),
        
        ("Sad", "A feeling of unhappiness, often due to loss or disappointment"),
        ("Sadness", "A deep, lingering feeling of sorrow or grief, often connected to personal loss"),
        ("Loneliness", "A feeling of being alone or disconnected, even in the presence of others"),
        ("Nostalgia", "A sentimental longing or wistful affection for past experiences or times"),
        ("Grief", "An intense, often overwhelming sadness caused by loss, such as the death of a loved one"),
        
        ("Angry", "A feeling of irritation, frustration, or upset due to something perceived as unfair or wrong"),
        ("Anger", "A strong emotional response to frustration, often with feelings of rage or hostility"),
        ("Frustration", "A feeling of being blocked or unable to achieve something you desire or need"),
        ("Irritation", "A mild feeling of annoyance or impatience, often triggered by small inconveniences"),
        ("Rage", "An intense, overwhelming form of anger that can lead to loss of control"),
        
        ("Anxious", "A feeling of nervousness or worry, often about uncertain outcomes or situations"),
        ("Anxiety", "A persistent, ongoing feeling of unease or fear about future events or possibilities"),
        ("Worry", "A feeling of concern or anxiety about potential problems or challenges"),
        ("Overwhelm", "A feeling of being unable to manage responsibilities or emotions, often leading to stress"),
        ("Panic", "A sudden and intense feeling of fear or anxiety, often accompanied by physical symptoms like rapid heart rate or shortness of breath"),
        
        ("Confused", "A feeling of uncertainty or lack of clarity, often accompanied by difficulty in decision-making"),
        ("Confusion", "A lack of understanding or mental clarity, often resulting in a sense of being lost or unsure"),
        ("Doubt", "A feeling of uncertainty about a decision, action, or belief, often leading to indecisiveness"),
        ("Indecision", "Difficulty making choices or reaching conclusions, often due to conflicting thoughts or feelings"),
        ("Disorientation", "A feeling of being mentally or physically lost, with difficulty in understanding direction or purpose"),
        
        ("Fearful", "A general feeling of being scared, nervous, or apprehensive about something threatening"),
        ("Fear", "An emotional response to a perceived danger or threat, often with physical symptoms like increased heart rate"),
        ("Insecurity", "A lack of confidence or certainty in oneself or one's surroundings, often leading to feelings of vulnerability"),
        ("Dread", "A strong sense of unease or apprehension, often in anticipation of a negative event"),
        ("Terror", "An intense, overwhelming feeling of fear, often leading to a loss of control or panic"),
        
        ("Surprised", "A feeling of being caught off guard or experiencing something unexpected"),
        ("Surprise", "An emotional reaction to something unforeseen or unfamiliar, often involving shock or amazement"),
        ("Awe", "A feeling of deep respect or admiration, often accompanied by a sense of wonder at something impressive or grand"),
        ("Amazement", "A feeling of astonishment or overwhelming wonder at something extraordinary or unexpected"),
        ("Shock", "A sudden, intense emotional response to something completely unexpected or startling")
    ]

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue.ignoresSafeArea()
                
                VStack {
                    Text("Find your Feelings")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title.bold())
                        .foregroundStyle(Color.elementsColor)
                        .padding(.horizontal)
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(feelings, id: \.name) { feeling in
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(feeling.name)
                                            .font(.headline)
                                            .foregroundStyle(Color.elementsColor)
                                        
                                        Text(feeling.description)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.elementsColor.opacity(0.8))
                                    }
                                    Spacer()
                                    Circle()
                                        .frame(maxWidth: 20)
                                        .foregroundStyle(gradientForCategory(feeling.name))
                                        .shadow(radius: 5)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.backgroundCustomBlueColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                        .padding()
                    }
                }
            }
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
    FeelingsView()
}
