//
//  QuestCardView.swift
//  LoreBuilder
// QuestCardView displays information about a single quest
// It shows the quest icon, title, difficulty, and XP reward

import SwiftUI

struct QuestCardView: View {
    
    let quest: Quest
    
    var body: some View {
        
        VStack(spacing: 12) {
        // Displays an icon based on the quest difficulty
            // The icon comes from the QuestDifficulty enum
            Image(systemName: quest.difficulty.icon)
                .font(.largeTitle)
            // Displays the quest title & centered to hold longer descriptions
            Text(quest.title)
                .font(.title3)
                .multilineTextAlignment(.center)
        // Displays the difficulty level (Easy, Medium, etc.)

            Text(quest.difficulty.rawValue.capitalized)
                .font(.caption)
                .padding(6)
    // Displays how many XP points the quest rewards
            Text("Reward: \(quest.difficulty.xpReward) Lore Points")
                .font(.footnote)
        }
        .padding() // Adds spacing inside the card
        // Creates a frosted glass background effect
        .background(.ultraThinMaterial)
        // Rounds the corners of the quest card
        .cornerRadius(15)
    }
}
