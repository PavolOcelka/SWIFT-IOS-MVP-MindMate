
import SwiftUI

struct FeelingsView: View {
    let feelings: [(name: String, description: String)] = [
        // Happy
        ("Happy", "Feeling good and positive"),
        ("Joy", "Intense happiness and delight"),
        ("Contentment", "Peaceful satisfaction"),
        ("Gratitude", "Thankful for what you have"),
        ("Pride", "Satisfaction in your achievements"),
        ("Hope", "Optimism for the future"),
        ("Love", "Deep affection and care"),
        ("Relief", "Release from stress or worry"),
        
        // Sad
        ("Sad", "Feeling down or unhappy"),
        ("Sadness", "Deep sorrow or grief"),
        ("Loneliness", "Feeling alone or disconnected"),
        ("Nostalgia", "Longing for the past"),
        ("Grief", "Deep sadness after a loss"),
        
        // Angry
        ("Angry", "Feeling mad or upset"),
        ("Anger", "Strong frustration or rage"),
        ("Frustration", "Feeling stuck or blocked"),
        ("Irritation", "Mild annoyance or impatience"),
        ("Rage", "Intense, uncontrollable anger"),
        
        // Anxious
        ("Anxious", "Feeling nervous or worried"),
        ("Anxiety", "Persistent worry or fear"),
        ("Worry", "Concern about potential problems"),
        ("Overwhelm", "Feeling unable to cope"),
        ("Panic", "Sudden intense fear or anxiety"),
        
        // Confused
        ("Confused", "Feeling uncertain or unclear"),
        ("Confusion", "Lack of understanding"),
        ("Doubt", "Uncertainty about decisions"),
        ("Indecision", "Difficulty making choices"),
        ("Disorientation", "Feeling lost or unsure"),
        
        // Fearful
        ("Fearful", "Feeling scared or afraid"),
        ("Fear", "Alertness to danger or threat"),
        ("Insecurity", "Lack of confidence"),
        ("Dread", "Anticipation of something bad"),
        ("Terror", "Intense, overwhelming fear"),
        
        // Surprised
        ("Surprised", "Feeling caught off guard"),
        ("Surprise", "Reaction to the unexpected"),
        ("Awe", "Feeling of wonder or amazement"),
        ("Amazement", "Overwhelmed by something grand"),
        ("Shock", "Sudden intense surprise")
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
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(feeling.name)
                                        .font(.headline)
                                        .foregroundStyle(Color.elementsColor)
                                    
                                    Text(feeling.description)
                                        .font(.subheadline)
                                        .foregroundStyle(Color.elementsColor.opacity(0.8))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(gradientForCategory(feeling.name))
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
