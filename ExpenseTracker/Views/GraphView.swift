//
//  GraphView.swift
//  ExpenseTracker
//
//  Created by Chia Kian An on 1/10/24.
//

import SwiftUI

struct LineGraph: Shape {
    var dataPoints: [CGFloat]

    func path(in rect: CGRect) -> Path {
        var path = Path()

        guard dataPoints.count > 1 else { return path }

        let stepX = rect.width / CGFloat(dataPoints.count - 1)
        let stepY = rect.height / (dataPoints.max() ?? 1)

        path.move(to: CGPoint(x: 0, y: rect.height - dataPoints[0] * stepY))

        for index in 1..<dataPoints.count {
            let point = CGPoint(x: CGFloat(index) * stepX, y: rect.height - dataPoints[index] * stepY)
            path.addLine(to: point)
        }

        return path
    }
}

struct GraphView: View {
    let dataPoints: [CGFloat] = [20, 5, 15, 20, 10, 25, 30] // Mock data
    
    var body: some View {
        LineGraph(dataPoints: dataPoints)
            .stroke(Color.white, lineWidth: 2)
            .frame(height: 200)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
    }
}

#Preview {
    GraphView()
}
