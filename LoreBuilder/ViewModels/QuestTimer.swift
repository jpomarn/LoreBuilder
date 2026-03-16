//
//  QuestTimer.swift
//  LoreBuilder
//
// QuestTimer manages the countdown until midnight (next daily reset)
// It conforms to ObservableObject so SwiftUI views can react to updates


import Foundation
import Combine

class QuestTimer: ObservableObject {
    
    @Published var timeRemaining: String = ""
    
    var timer: Timer?
    
    init() {
        updateTimer()
        startTimer()
    }
    // Starts a repeating timer that triggers every second

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateTimer()
        }
    }
    // Calculates the time remaining until midnight

    func updateTimer() {
        
        let calendar = Calendar.current
        let now = Date()
        
        let tomorrow = calendar.nextDate(
            after: now,
            matching: DateComponents(hour: 0, minute: 0, second: 0),
            matchingPolicy: .nextTime
        )!
        
        let diff = Int(tomorrow.timeIntervalSince(now))
        
        let hours = diff / 3600
        let minutes = (diff % 3600) / 60
        let seconds = diff % 60
        
        timeRemaining = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
