//
//  Shapes.swift
//  Set
//
//  Created by Rudolf Farkas on 12.09.21.
//

import SwiftUI

/*
 from measurements on the wikipedia Set game page

  shape.aspectRatio ~ 2.0
  shape.width ~ frame.width * 0.63
  shape.step ~ frame.height * 0.25
  */

struct Shapes: View {
    var body: some View {
        HStack {
            VStack(spacing: 20) {
//            Squiggle().stroke()
//            Squiggle() // .fill() // default
                VStripes(color: .pink)
                Squiggle().stroke().modifier(AddStripesToSquiggle())
                Squiggle().stroke().addStripedSquiggle()
                Diamond().stroke().addStripedSquiggle() // no good

            }.foregroundColor(.blue)
            VStack {
                // precursor code - could we convert it to a shape style?
                Squiggle().stroke(lineWidth: 6).background(VStripes(color: .orange)).mask(Squiggle()).foregroundColor(.orange)
                Diamond().stroke(lineWidth: 6).background(VStripes(color: .green)).mask(Diamond()).foregroundColor(.green)
                Capsule().stroke(lineWidth: 6).background(VStripes(color: .blue)).mask(Capsule()).foregroundColor(.blue)
            }
            VStack {
                Striped(Diamond(), color: .purple, lineWidth: 3) // looks even better
                Striped(Squiggle(), color: .purple, lineWidth: 3) // looks even better
                Striped(Capsule(), color: .purple, lineWidth: 3) // looks even better
            }
        }
    }
}

// case diamond, squiggle, oval

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let left = CGPoint(x: rect.minX, y: rect.midY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)

        var p = Path()
        p.move(to: left)
        p.addLine(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.closeSubpath()
        return p
    }
}

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let left = CGPoint(x: rect.minX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.minY)

        var p = Path()
        p.move(to: left)
        p.addCurve(to: right,
                   control1: CGPoint(x: rect.width * 0.25, y: rect.minY - rect.height),
                   control2: CGPoint(x: rect.width * 0.75, y: rect.maxY))
        p.move(to: right)
        p.addCurve(to: left,
                   control1: CGPoint(x: rect.width * 0.75, y: rect.maxY + rect.height),
                   control2: CGPoint(x: rect.width * 0.25, y: rect.minY))
        return p
    }
}

// see also https://www.reddit.com/r/SwiftUI/comments/ku5sl2/how_can_i_make_a_custom_shape_filled_with_stripes/

// see also https://www.swiftbysundell.com/articles/stroking-and-filling-a-swiftui-shape-at-the-same-time/

struct VStripes: View {
    let color: Color
    let lineOpacity = 0.5
    let numberOfStripes = 8

    var body: some View {
        GeometryReader { geometry in
            let spacing = geometry.size.width / (CGFloat(numberOfStripes) * 2)
            let lineWidth = spacing
            HStack(spacing: spacing) {
                ForEach(Range(0 ... numberOfStripes), id: \.self) { _ in
                    color.frame(width: lineWidth).opacity(lineOpacity)
                }
            }
        }
    }
}

struct Striped<Target>: View where Target: Shape {
    let target: Target
    let color: Color
    let lineWidth: CGFloat

    init(_ target: Target, color: Color, lineWidth: CGFloat) {
        self.target = target
        self.color = color
        self.lineWidth = lineWidth
    }

    var body: some View {
        VStripes(color: color)
            .mask(target)
            .overlay(target.stroke(color, lineWidth: lineWidth))
    }
}

/*
 Originally, we wanted a modifier similar to mask

 func mask<Mask>(_ mask: Mask) -> some View where Mask : View

 which applies a shape e.g.

 Image(systemName: "envelope.badge.fill")
     .foregroundColor(Color.blue)
     .font(.system(size: 128, weight: .regular))
     .mask(Rectangle().opacity(0.1))

 func addStripedSquiggle() below works, but is  useless except on Squiggle itself
 Squiggle().stroke().addStripedSquiggle()

 In fact, these here work

 StripedSquiggle(color: .orange)
 StripedDiamond(color: .green)
 StripedCapsule(color: .blue)

 but a separate view must be written for each shape.

 We vould like to have a a generic stripifying container

 Striped(Squiggle(), color: ...)
 Striped(Diamond(), color: ...)
 Striped(Capsule(), color: ...)

 These here also work, but are clumsy

 Squiggle().stroke(lineWidth: 6).background(StripedView(color: .orange)).mask(Squiggle()).foregroundColor(.orange)
 Diamond().stroke(lineWidth: 6).background(VStripes(color: .green)).mask(Diamond()).foregroundColor(.green)
 Capsule().stroke(lineWidth: 6).background(VStripes(color: .blue)).mask(Capsule()).foregroundColor(.blue)

 We vould like to have a modifier that would work like this

 Squiggle().striped(...)
 Diamond().striped(...)
 Capsule().striped(...)

 where striped() would apply VStripes as background, and the target view as a mask.

 */

// can this be generalized - using generics?

struct AddStripesToSquiggle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(VStripes(color: .pink).mask(Squiggle()))
    }
}

extension Shape {
    func addStripedSquiggle() -> some View {
        modifier(AddStripesToSquiggle())
    }
}

/* Try to parametrize the mask --- fails to compile
 struct AddStripes2<Mask>: ViewModifier where  Mask: View {
     let mask: Mask
     func body(content: Content) -> some View {
         content
             .background(VStripes(color: .pink).mask(Mask())) // Type 'Mask' has no member 'init'
     }
 }
 */

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
