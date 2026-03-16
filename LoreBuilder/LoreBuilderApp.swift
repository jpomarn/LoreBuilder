//
//  LoreBuilderApp.swift
//  LoreBuilder
// Entry point of the LoreBuilder app
// The @main attribute tells Swift where the app starts

import SwiftUI
// The @main attribute tells Swift where the app starts
@main
struct LoreBuilderApp: App {
// Creates a single instance of QuestViewModel for the entire app

    @StateObject var questVM = QuestViewModel()
// WindowGroup represents the main window of the app
    var body: some Scene {
        WindowGroup {
            // MainTabView is the root UI of the app
// environmentObject makes questVM available to all child views
            MainTabView()
                .environmentObject(questVM)
        }
    }
}
