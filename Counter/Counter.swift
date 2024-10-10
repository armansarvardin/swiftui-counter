//
//  ContentView.swift
//  Counter
//
//  Created by Arman Sarvardin on 10.10.2024.
//

import SwiftUI

struct Counter: View {
    
    @State private var count: Int = 0
    
    @State private var isLightTheme: Bool = UserDefaults.standard.string(forKey: "app-theme") == "light"
    
    @AppStorage("app-theme") private var appTheme = "light"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Your count: \(count)")
                    .font(
                        .system(
                            size: 40,
                            weight: .bold
                        )
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    
                    Toggle("Light theme", isOn: $isLightTheme)
                        .font(.headline)
                    
                    Button {
                        count += 1
                    } label: {
                        Text("+")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(.rect(cornerRadius: 8))
                    }
                    
                }

            }
            .padding()
            .onChange(
                of: isLightTheme,
                perform: { newValue in
                appTheme = newValue ? "light" : "dark"
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Reset") {
                        reset()
                    }
                    .font(.headline)
                }
            }
        }
        
    }
    
    private func reset() {
        count = 0
    }
}

#Preview {
    Counter()
}
