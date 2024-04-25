//
//  ContentView.swift
//  FRIENDS
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                
            Text("Hello, world!")
                .font(.custom("Assistant-Bold", size: 40))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
