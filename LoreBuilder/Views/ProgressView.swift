//
//  ProgressView.swift
//  LoreBuilder
// ProgressViewScreen shows the user's XP and weekly quest progress


import SwiftUI

struct ProgressViewScreen: View {
    
    @EnvironmentObject var viewModel: QuestViewModel
    
    var body: some View {
        
        ZStack {
            
            Theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Label("My Progress", systemImage: "chart.bar.fill")
                    .font(.largeTitle)
                
                Text("Experience Points: \(viewModel.xp) xp")
                    .font(.title)
                
                Text("\(viewModel.completedQuests.count) / \(viewModel.weeklyGoal) Weekly Quests Completed")
                    .font(.title2)
// Progress bar showing completion toward weekly goal

                ProgressView(
                    value: Double(viewModel.completedQuests.count),
                    total: Double(viewModel.weeklyGoal)
                )
                .tint(Theme.accent)
                .padding(.horizontal)
        // Pushes content upward for better layout spacing

                Spacer()
            }
            .padding()
        }
    }
}
