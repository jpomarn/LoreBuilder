//
//  Quest.swift
//  LoreBuilder
// Imports basic data types like Dates Quest Dificulty and Rewarded XP Points As well as implmenting symbols

import Foundation

// Enum that represents the difficulty level of a quest
// Raw values are Strings and CaseIterable allows looping through all cases
enum QuestDifficulty: String, CaseIterable {
    
    case easy
    case medium
    case hard
    case legendary
    
    // Computed property that returns how much XP each difficulty rewards
    var xpReward: Int {
        switch self {
        case .easy:
            return 10
        case .medium:
            return 20
        case .hard:
            return 40
        case .legendary:
            return 75
        }
    }
    
    // Computed property that returns the SF Symbol icon associated with each difficulty
    var icon: String {
        switch self {
        case .easy:
            return "leaf.fill"      // Symbol representing an easy task
        case .medium:
            return "flame.fill"     // Symbol representing moderate difficulty
        case .hard:
            return "bolt.fill"      // Symbol representing a challenging quest
        case .legendary:
            return "crown.fill"     // Symbol representing the hardest/legendary quests
        }
    }
}

// Struct representing a quest in the app
// Conforms to Identifiable so it can be used in SwiftUI lists
struct Quest: Identifiable {
    
    let id = UUID() // Unique identifier for each quest
    
    let title: String // Title or description of the quest
    
    let difficulty: QuestDifficulty // Difficulty level of the quest
    
    var completedDate: Date? //Date 
}
