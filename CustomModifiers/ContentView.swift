//
//  ContentView.swift
//  CustomModifiers
//
//  Created by Rudolf Farkas on 30.09.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: { ShapeStrokeAndFill() }, label: { Text("ShapeStrokeAndFill") })
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
