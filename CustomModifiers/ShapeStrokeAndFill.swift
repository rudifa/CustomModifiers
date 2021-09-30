//
//  ShapeStrokeAndFill.swift
//  CustomModifiers
//
//  Created by Rudolf Farkas on 30.09.21.
//

import SwiftUI

// from https://swiftuirecipes.com/blog/stroke-and-fill-a-shape-in-swiftui

/*

 For whatever reason, stroking (i.e drawing a border) and filling a SwiftUI Shape at the same time is difficult and unintuitive. Shape has methods for both, stroke and fill, respectively, but they both return some View, meaning you can't chain them.

 The proper way is to set the stroke first and then put the same view in background:

 Circle()
   .stroke(Color.red, lineWidth: 7)
   .background(Circle().fill(Color.green))

 Doing this over and over again can be tiresome, so here's a neat extension that condenses it all into a single method:

 */

// Need this to let the extension know that the Shape
// can be instantiated without additional params.
protocol ParameterlessInitable {
    init()
}

// Make existing Shapes conform to the new protocol.
extension Circle: ParameterlessInitable {}
extension Rectangle: ParameterlessInitable {}
extension Capsule: ParameterlessInitable {
    init() {
        self.init(style: .circular)
    }
}
extension Diamond: ParameterlessInitable {}
extension Squiggle: ParameterlessInitable {}


extension Shape where Self: ParameterlessInitable {
    func stroke<StrokeStyle, FillStyle>(
        _ strokeStyle: StrokeStyle,
        lineWidth: CGFloat = 1,
        fill fillStyle: FillStyle
    ) -> some View where StrokeStyle: ShapeStyle, FillStyle: ShapeStyle {
        Self()
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(Self().fill(fillStyle))
    }
}

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

struct ShapeStrokeAndFill_Previews: PreviewProvider {
    static var previews: some View {
        ShapeStrokeAndFill()
    }
}
