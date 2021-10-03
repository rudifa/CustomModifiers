//
//  Shapes.swift
//  Set
//
//  Created by Rudolf Farkas on 12.09.21.
//

import rfSwiftUI
import SwiftUI

struct Shapes: View {
    var body: some View {
        HStack {
            VStack(spacing: 20) {
                VStripes()

            }.foregroundColor(.blue)
            VStack {
                // precursor code - could we convert it to a shape style?
                Squiggle().stroke(lineWidth: 6).background(VStripes()).mask(Squiggle()).foregroundColor(.orange)
                Diamond().stroke(lineWidth: 6).background(VStripes()).mask(Diamond()).foregroundColor(.green)
                Capsule().stroke(lineWidth: 6).background(VStripes()).mask(Capsule()).foregroundColor(.blue)
            }
            VStack {}
        }
    }
}

/// Demonstrates Custom Shapes
///
struct CustomShapesDemo: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 20) {
                Diamond()
                    .stroke(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 100)
                Diamond()
                    .stroke(Color.red, lineWidth: 10, fill: Color.blue)
                    .frame(width: 100, height: 66)
                Squiggle()
                    .stroke(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 100)
                Squiggle()
                    .stroke(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 66)
            }

            VStack(spacing: 20) {
                Diamond()
                    .strokeBorder(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 100)
                Diamond()
                    .strokeBorder(Color.red, lineWidth: 10, fill: Color.blue)
                    .frame(width: 100, height: 66)
                ZStack {
                    Squiggle()
                        .strokeBorder(Color.black, lineWidth: 10, fill: Color.pink)
                        .frame(width: 100, height: 100)
                    Squiggle()
                        .stroke(Color.yellow, lineWidth: 1)
                        .frame(width: 100, height: 100)
                }
                ZStack {
                    Squiggle()
                        .strokeBorder(Color.black, lineWidth: 10, fill: Color.pink)
                        .frame(width: 100, height: 66)
                    Squiggle()
                        .stroke(Color.yellow, lineWidth: 1)
                        .frame(width: 100, height: 66)
                }
            }
        }
    }
}

/// Demonstrates filling a shape with vertically striped background
///
struct StripedShapesDemo: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 20) {
                Diamond()
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Squiggle()
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Capsule()
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
                RoundedRectangle(cornerRadius: 6)
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
            }
            .foregroundColor(.pink)

            VStack(spacing: 20) {
                Diamond()
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Squiggle()
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Capsule()
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
                RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
            }
            .foregroundColor(.blue)

            VStack(spacing: 20) {
                Diamond()
                    .fill()
                    .frame(width: 100, height: 66)
                Squiggle()
                    .fill()
                    .frame(width: 100, height: 66)
                Capsule()
                    .fill()
                    .frame(width: 100, height: 66)
                RoundedRectangle(cornerRadius: 6)
                    .fill()
                    .frame(width: 100, height: 66)
            }
            .foregroundColor(.green)
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
