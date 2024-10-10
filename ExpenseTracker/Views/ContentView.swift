//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Chia Kian An on 1/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var showingSettings = false
    @Query var expenses: [Expense]  // Fetch all expenses

    var body: some View {
        NavigationView {
            VStack {
                // Navigation bar
                HStack {
                    Button(action: {
                        // Settings action
                        showingSettings.toggle()
                    }) {
                        Image(systemName: "gear")
                            .font(.title)
                    }
                    Spacer()
                    
                    Text("Today")
                        .font(.headline)
                    
                    Spacer()
                    
                    // Placeholder for month navigation
                    Button(action: {
                        // Date picker for month selection
                    }) {
                        Text("Sep")
                    }
                }
                .padding()
                
                // Graph View
                GraphView()
                    .padding(.horizontal)
                
                // Expense View
                ExpenseView(expenses: expenses)
                
                Spacer()
                
                Button("Test Clear")
                {
                    // delete all expenses
                    
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showingSettings) {
                SettingsView()
            }
        }
    }
}


#Preview {
    ContentView()
}
