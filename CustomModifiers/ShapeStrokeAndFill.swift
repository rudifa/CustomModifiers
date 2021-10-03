//
//  ShapeStrokeAndFill.swift
//  CustomModifiers
//
//  Created by Rudolf Farkas on 30.09.21.
//

import rfSwiftUI
import SwiftUI

struct ShapeStrokeAndFill: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(Color.red, lineWidth: 7, fill: Color.green)
                .frame(width: 60, height: 60)
            Capsule()
                .stroke(Color.blue, lineWidth: 5, fill: Color.orange)
                .frame(width: 100, height: 60)
            Diamond()
                .stroke(Color.black, lineWidth: 10, fill: Color.pink)
                .frame(width: 100, height: 60)
            Squiggle()
                .stroke(Color.black, lineWidth: 10, fill: Color.white)
                .frame(width: 100, height: 60)
            Rectangle()
                .stroke(Color.black, lineWidth: 10, fill: Color.white)
                .frame(width: 100, height: 60)
        }
    }
}

// Demonstrates Shape Stroke and Fill methods on Shapes
///
struct ShapeStrokeAndFillDemo: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 20) {
                Circle()
                    .stroke(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 100)
                Ellipse()
                    .stroke(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 60)
                Capsule()
                    .stroke(Color.blue, lineWidth: 4, fill: Color.orange)
                    .frame(width: 100, height: 60)
                RoundedRectangle(cornerRadius: CGFloat(5))
                    .stroke(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .red],
                        startPoint: .top,
                        endPoint: .bottom
                    ))

                    .frame(width: 100, height: 60)
                Rectangle()
                    .stroke(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 100, height: 60)
            }

            VStack(spacing: 20) {
                Circle()
                    .strokeBorder(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 100)
                Ellipse()
                    .strokeBorder(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 60)
                Capsule()
                    .strokeBorder(Color.blue, lineWidth: 4, fill: Color.orange)
                    .frame(width: 100, height: 60)
                RoundedRectangle(cornerRadius: CGFloat(5))
                    .strokeBorder(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .red],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 100, height: 60)

                Rectangle()
                    .strokeBorder(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 100, height: 60)
            }
        }
    }
}

struct ShapeStrokeAndFill_Previews: PreviewProvider {
    static var previews: some View {
        ShapeStrokeAndFill()
    }
}
