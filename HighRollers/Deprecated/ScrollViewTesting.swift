//
//  ScrollViewTesting.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/15/24.
//

import SwiftUI

struct ScrollViewTesting: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 1 : 4,
                                                spacing: 16)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                            
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

struct Item: Identifiable {
    let id = UUID()
    let color: Color
}

struct MockData {
    static var items = [Item(color: .teal),
                        Item(color: .pink),
                        Item(color: .indigo),
                        Item(color: .orange),
                        Item(color: .purple),
                        Item(color: .yellow),
                        Item(color: .green),
                        Item(color: .blue),
                        Item(color: .brown),
                        Item(color: .red),]
}

#Preview {
    ScrollViewTesting()
}
