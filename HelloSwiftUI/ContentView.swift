//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by drypot on 2022/10/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, SwiftUI!")
        }
        .padding()
        //.frame(minWidth:480, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
