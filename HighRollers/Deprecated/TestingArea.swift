//
//  TestingArea.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/14/24.
//

import SwiftUI

struct Drawing: Equatable, Identifiable {
    var id = UUID()
    var name: String
}

struct TestingArea: View {
    @State private var isOn = false
    @State private var drawings = [Drawing(name: "circle"), Drawing(name: "square")]
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(Array(drawings.enumerated()), id: \.element.id) { index, drawing in
                    Circle()
                        .transition(.asymmetric(insertion: .push(from: .bottom), removal: .scale))
                        .contextMenu {
                            Button("Kill Me", role: .destructive) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                    withAnimation(.bouncy) {
                                        _ = drawings.remove(at: index)
                                    }
                                }
                            }
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .destructive) {
                        withAnimation(.bouncy) {
                            drawings.removeAll()
                        }
                    } label: {
                        Image(systemName: "trash")
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        withAnimation(.bouncy) {
                            drawings.append(Drawing(name: "circle"))
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
        }
    }
}

#Preview {
    TestingArea()
}
