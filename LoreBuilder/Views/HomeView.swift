//
//  HomeView.swift
//  LoreBuilder
// HomeView is the main screen of the app where the user
// sees their current quest and can complete it

import SwiftUI

struct HomeView: View {
    // Access the shared QuestViewModel from the environment
    // This allows the view to read and modify quest data
    @EnvironmentObject var viewModel: QuestViewModel
    
    var body: some View {
        
        ZStack {
            
            Theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Text("LoreBuilder")
                    .font(.largeTitle)
// Safely unwrap the current quest if one exists
                // If available, display the quest card
                if let quest = viewModel.currentQuest {
                    QuestCardView(quest: quest)
                }
                
                Button("Click Complete Quest") {
                    viewModel.completeQuest()
                }
                .tint(Theme.accent)
                
                TimerView()
                
                Spacer()
            }
            .padding()
        }
    }
}
