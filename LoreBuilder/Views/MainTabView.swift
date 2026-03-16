//
//  MainTabView.swift
//  LoreBuilder
//  Tab View making Home,Progress, and Log with their coresponding Image 

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ProgressViewScreen()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
            
            CalendarView()
                .tabItem {
                    Label("Log", systemImage: "calendar")
                }
        }
    }
}
