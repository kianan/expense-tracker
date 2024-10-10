//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Chia Kian An on 1/10/24.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Expense.self])  // Set up the model container
        }
    }
}
