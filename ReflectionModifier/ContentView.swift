//
//  ContentView.swift
//  ReflectionModifier
//
//  Created by test on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("SwiftUI")
                .font(.system(size: 100))
                .foregroundStyle(.blue.gradient)
                .reflection(spacing: -20)
        }
        .padding()
    }
}

struct ReflectionModifier: ViewModifier {
    var opacity: Double
    var spacing: CGFloat
    
    func body(content: Content) -> some View {
        VStack {
            content
            content
                .scaleEffect(-1)
                .mask(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                )
                .opacity(opacity)
                .offset(y: spacing)
                .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.2))
                .scaleEffect(1.09)
        }
    }
}

extension View {
    func reflection(opacity: Double = 0.4, spacing: CGFloat = 0) -> some View {
        self.modifier(ReflectionModifier(opacity: opacity, spacing: spacing))
    }
}

#Preview {
    ContentView()
}
