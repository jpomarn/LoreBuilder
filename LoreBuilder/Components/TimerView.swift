//
// TimerView.swift
// LoreBuilder
// Displays the 24-hour quest countdown timer.


// Imports the SwiftUI framework used to build the UI
import SwiftUI

// Defines a SwiftUI view called TimerView
struct TimerView: View {
    
    // Creates a state object that manages the quest timer
    // @StateObject keeps the object alive while the view exists
    // and updates the UI automatically when its data changes
    @StateObject var timer = QuestTimer()
    
    var body: some View { // Required property that defines the UI layout
        
        VStack { // VStack arranges UI elements vertically
            
            Label("Complete A Quest In 24 Hours ", systemImage: "clock.fill")
                .font(.headline)
            
            // Displays the remaining time from the timer object
            // This updates automatically when timer.timeRemaining changes
            Text(timer.timeRemaining)
                .font(.largeTitle) // Makes the timer text large
                .monospacedDigit() // Ensures digits stay aligned while counting down
        }
        .padding() 
    }
}
