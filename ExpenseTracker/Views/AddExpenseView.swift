//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Chia Kian An on 10/10/24.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @Environment(\.modelContext) private var modelContext   // SwiftData model context to save expenses
    @Environment(\.dismiss) private var dismiss             // To dismiss the view after saving
    
    // State variables for the form input
    @State private var expenseName: String = ""
    @State private var expenseAmount: Double = 0.0
    @State private var expenseDate = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details")) {
                    TextField("Expense Name", text: $expenseName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical)
                    
                    TextField("Amount", value: $expenseAmount, format: .number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .padding(.vertical)
                    
                    DatePicker("Date", selection: $expenseDate, displayedComponents: .date)
                        .padding(.vertical)
                }
                
                Section {
                    Button(action: saveExpense) {
                        Text("Save Expense")
                            .frame(maxWidth: .infinity)
                    }
                    .disabled(expenseName.isEmpty || expenseAmount <= 0)  // Disable button if inputs are invalid
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()  // Dismiss view without saving
            })
        }
    }
}

extension AddExpenseView {
    private func saveExpense() {
        // Create a new Expense instance
        let newExpense = Expense(name: expenseName, amount: expenseAmount, date: expenseDate)
        
        // Insert the new expense into the SwiftData context
        modelContext.insert(newExpense)
        
        // Save the context to persist the data
        do {
            try modelContext.save()
            dismiss()  // Dismiss the view after successful save
        } catch {
            print("Failed to save expense: \(error)")
        }
    }
}

#Preview {
    AddExpenseView()
}
