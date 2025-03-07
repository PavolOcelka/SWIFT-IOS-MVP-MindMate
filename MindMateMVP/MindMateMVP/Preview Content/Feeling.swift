//
//  File.swift
//  MindMate
//
//  Created by Pavol Ocelka on 23/02/2025.
//

import Foundation

// MARK: - Feeling Data Model
struct Feeling: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: String
    let description: String
}

// MARK: - Sample Feelings Data
let feelingsData: [Feeling] = [
    // Happy
    Feeling(name: "Joy", category: "Happy", description: "A bright, uplifting emotion often accompanied by smiles and laughter"),
    Feeling(name: "Contentment", category: "Happy", description: "Peaceful satisfaction with the present moment"),
    Feeling(name: "Gratitude", category: "Happy", description: "Appreciation for positive aspects of life"),
    Feeling(name: "Pride", category: "Happy", description: "Sense of accomplishment in your achievements"),
    Feeling(name: "Hope", category: "Happy", description: "Optimistic expectation for positive outcomes"),
    Feeling(name: "Love", category: "Happy", description: "Deep affection and care for someone/something"),
    Feeling(name: "Relief", category: "Happy", description: "Release from stress or worry"),
    
    // Sad
    Feeling(name: "Sadness", category: "Sad", description: "A low, heavy feeling when experiencing loss or disappointment"),
    Feeling(name: "Loneliness", category: "Sad", description: "Feeling disconnected from others, craving connection"),
    Feeling(name: "Nostalgia", category: "Sad", description: "Bittersweet longing for past experiences"),
    Feeling(name: "Grief", category: "Sad", description: "Deep sorrow, especially after a loss"),
    
    // Angry
    Feeling(name: "Anger", category: "Angry", description: "Strong frustration or irritation, often with physical tension"),
    Feeling(name: "Frustration", category: "Angry", description: "Feeling upset due to inability to change something"),
    Feeling(name: "Irritation", category: "Angry", description: "Mild anger or annoyance"),
    Feeling(name: "Rage", category: "Angry", description: "Intense, uncontrollable anger"),
    
    // Anxious
    Feeling(name: "Anxiety", category: "Anxious", description: "Worry about future events with racing thoughts and restlessness"),
    Feeling(name: "Worry", category: "Anxious", description: "Persistent thoughts about potential problems"),
    Feeling(name: "Overwhelm", category: "Anxious", description: "Feeling unable to cope with demands"),
    Feeling(name: "Panic", category: "Anxious", description: "Sudden intense fear or anxiety"),
    
    // Confused
    Feeling(name: "Confusion", category: "Confused", description: "Uncertainty about how to proceed or understand"),
    Feeling(name: "Doubt", category: "Confused", description: "Feeling uncertain about decisions or beliefs"),
    Feeling(name: "Indecision", category: "Confused", description: "Difficulty making choices"),
    Feeling(name: "Disorientation", category: "Confused", description: "Feeling lost or unsure of surroundings"),
    
    // Fearful
    Feeling(name: "Fear", category: "Fearful", description: "Alertness to perceived danger or threat"),
    Feeling(name: "Insecurity", category: "Fearful", description: "Lack of confidence in oneself"),
    Feeling(name: "Dread", category: "Fearful", description: "Anticipation of something bad happening"),
    Feeling(name: "Terror", category: "Fearful", description: "Intense, overwhelming fear"),
    
    // Surprised
    Feeling(name: "Surprise", category: "Surprised", description: "Reaction to something unexpected"),
    Feeling(name: "Awe", category: "Surprised", description: "Overwhelmed by something grand or extraordinary"),
    Feeling(name: "Amazement", category: "Surprised", description: "Feeling of wonder or astonishment"),
    Feeling(name: "Shock", category: "Surprised", description: "Sudden intense surprise or disbelief")
]
