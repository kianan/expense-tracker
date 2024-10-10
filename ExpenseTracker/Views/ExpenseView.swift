//
//  ExpenseView.swift
//  ExpenseTracker
//
//  Created by Chia Kian An on 1/10/24.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    @State private var selectedDate = Date()
    var expenses: [Expense] = []
    
    var filteredExpenses: [Expense] {
        let calendar = Calendar.current
        return expenses.filter {
            calendar.isDate($0.date, inSameDayAs: selectedDate)
        }}
    
    var body: some View {
        VStack {
            HStack {
                Text("\(filteredExpenses.count)")
                    .font(.largeTitle)
                    .bold()
                VStack(alignment: .leading) {
                    Text("\(formattedDate(selectedDate))")
                    Text("Total: \(formattedTotal())")
                }
                Spacer()
                
                NavigationLink(destination: AddExpenseView()) {
                    Image(systemName: "plus.circle")
                        .font(.title)}
            }
            .padding()
            
            Divider()
            
            // for testing: Date picker to filter expenses by date
//            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
//                .datePickerStyle(GraphicalDatePickerStyle())
//                .padding()
//
//            Divider()
            
            // fetch all expenses and list it
            
            // List of expenses
            List(filteredExpenses) { expense in
                HStack {
                    Image(systemName: "fork.knife")
                    Text(expense.name)
                    Spacer()
                    Text(String(format: "$%.2f", expense.amount))
                }
                .padding(.vertical, 5)
            }
        }
    }
    
    // Helper function to format the total expenses
    private func formattedTotal() -> String {
        let total = filteredExpenses.reduce(0) { $0 + $1.amount }
        return String(format: "$%.2f", total)
    }

    // Helper function to format the date for display
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}


#Preview {
    let testExpenses = [
        Expense(name: "Groceries", amount: 50.0, date: Date()),
        Expense(name: "Dinner", amount: 30.0, date: Date()),
        Expense(name: "Fuel", amount: 20.0, date: Date()),
        Expense(name: "Coffee", amount: 5.0, date: Date().addingTimeInterval(-86400)), // 1 day before
    ]
    
    ExpenseView(expenses: testExpenses)
}
