//
//  SettingsView.swift
//  ExpenseTracker
//
//  Created by Chia Kian An on 1/10/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                // Preferences Section
                Section(header: Text("PREFERENCES")) {
                    NavigationLink(destination: CustomizeCategoriesView()) {
                        Text("Customize Categories")
                    }
                    NavigationLink(destination: DecimalInputModeView()) {
                        Text("Input Mode for Decimal Numbers")
                    }
                }

                // Data Section
                Section(header: Text("DATA")) {
                    Button(action: {
                        // Action to export CSV
                    }) {
                        Text("Export CSV")
                    }

                    Button(action: {
                        // Action to export JSON
                    }) {
                        Text("Export JSON")
                    }

                    NavigationLink(destination: ImportInstructionsView()) {
                        Text("Import Instructions")
                    }
                    
                    Text("Please choose \"Export JSON\" if you want to make a backup.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }

                // App Section
                Section(header: Text("APP")) {
                    NavigationLink(destination: FeedbackView()) {
                        Text("Feedback")
                    }
                    Button(action: {
                        // Action to rate the app
                    }) {
                        Text("Rate This App")
                    }
                    NavigationLink(destination: AboutUsView()) {
                        Text("About Us")
                    }
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done") {
                // Dismiss settings action
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    SettingsView()
}


struct CustomizeCategoriesView: View {
    var body: some View {
        Text("Customize Categories")
            .navigationBarTitle("Customize Categories", displayMode: .inline)
    }
}

struct DecimalInputModeView: View {
    var body: some View {
        Text("Decimal Input Mode")
            .navigationBarTitle("Decimal Input Mode", displayMode: .inline)
    }
}

struct ImportInstructionsView: View {
    var body: some View {
        Text("Import Instructions")
            .navigationBarTitle("Import Instructions", displayMode: .inline)
    }
}

struct FeedbackView: View {
    var body: some View {
        Text("Feedback")
            .navigationBarTitle("Feedback", displayMode: .inline)
    }
}

struct AboutUsView: View {
    var body: some View {
        Text("About Us")
            .navigationBarTitle("About Us", displayMode: .inline)
    }
}
