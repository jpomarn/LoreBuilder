//
//  QuestViewModel.swift
//  LoreBuilder
// QuestViewModel manages the state and logic for quests in the app and Conforms to ObservableObject so SwiftUI views can observe and react to change

import Foundation
import Combine

class QuestViewModel: ObservableObject {
    
    // Notifies SwiftUI to update the UI when it changes
    @Published var currentQuest: Quest?
    // Stores all quests the user has completed
    @Published var completedQuests: [Quest] = []
    // Tracks the player's total experience points
    @Published var xp: Int = 0
    
    let weeklyGoal = 7
    
    // List of possible quests that can be randomly generated
    let quests: [Quest] = [
        Quest(title: "Take a 10 minute walk", difficulty: .easy),
        Quest(title: "Talk to someone new", difficulty: .medium),
        Quest(title: "Try a new coffee shop", difficulty: .hard),
        Quest(title: "Spend 1 hour learning something new", difficulty: .legendary),
        Quest(title: "Write a short journal entry", difficulty: .easy),
        Quest(title: "Compliment someone today", difficulty: .medium)
    ]
    // Runs when the ViewModel is first created

    init() {
        generateQuest()
    }
    
    // Selects a random quest from the quest list

    func generateQuest() {
        currentQuest = quests.randomElement()
    }
    // Updates completion date, XP, and generates a new quest

    func completeQuest() {
        
        guard var quest = currentQuest else { return }
        
        quest.completedDate = Date()
        
        completedQuests.append(quest)
        
        xp += quest.difficulty.xpReward
        
        generateQuest()
    }
}
