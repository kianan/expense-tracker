//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Chia Kian An on 10/10/24.
//

import Foundation
import SwiftData

@Model class Expense {
    var name: String
    var amount: Double
    var date: Date

    init(name: String, amount: Double, date: Date) {
        self.name = name
        self.amount = amount
        self.date = date
    }
}
