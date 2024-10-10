//
//  ContentView.swift
//  Counter
//
//  Created by Arman Sarvardin on 10.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("app-theme") var theme: String = "light"
    
    @State private var count: Int = 0
    
    var body: some View {
        Counter()
            .colorScheme(theme == "light" ? .light : .dark)
            .animation(
                .smooth,
                value: theme
            )
    }
    
}

#Preview {
    ContentView()
}
