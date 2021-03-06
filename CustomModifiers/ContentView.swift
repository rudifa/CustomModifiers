//
//  ContentView.swift
//  CustomModifiers
//
//  Created by Rudolf Farkas on 30.09.21.
//

import SwiftUI

/// Presents a selection of demos
///
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: { ShapeStrokeAndFillDemo() }, label: { Text("Shape Stroke and Fill") })
                NavigationLink(destination: { CustomShapesDemo() }, label: { Text("Custom Shapes ") })

                NavigationLink(destination: { StripedShapesDemo() }, label: { Text("Striped Shapes ") })
            }
            .navigationBarTitle(Text("Demos"))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
