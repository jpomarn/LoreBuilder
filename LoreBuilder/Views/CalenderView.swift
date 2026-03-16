//
//  CalenderView.swift
//  LoreBuilder
// It acts as the user's "adventure log" history
// CalendarView displays a list of all completed quests

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var viewModel: QuestViewModel
    
    var body: some View {
    // Provides a navigation bar and enables navigation features

        NavigationView {
    // ZStack allows the background and content to be layered
            ZStack {
                
                Theme.background
                    .ignoresSafeArea()
    // Displays a scrollable list of completed quests

                List(viewModel.completedQuests) { quest in
                    
    // Horizontal layout for each quest row
                    HStack(spacing: 15) {
                        
                        Image(systemName: quest.difficulty.icon)
                            .font(.title2)
                            .foregroundColor(Theme.accent)
                        
    // Vertical stack for quest title and completion date
                        VStack(alignment: .leading) {
                            
                            Text(quest.title)
                                .font(.headline)
                            
        // If the quest has a completion date, display it
                            if let date = quest.completedDate {
                                Text(date.formatted(date: .abbreviated, time: .omitted))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(10)
                    .listRowBackground(Theme.card)
                    
                }
// Removes default list background so the custom theme shows
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Adventure Log")
        }
    }
}
