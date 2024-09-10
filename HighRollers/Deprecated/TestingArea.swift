//
//  TestingArea.swift
//  HighRollers
//
//  Created by Vakarva on 8/14/24.
//

import SwiftUI

struct Drawing: Equatable, Identifiable {
    var id = UUID()
    var name: String
}

struct TestingArea: View {
    @State private var isOn = false
    @State private var drawings = [Drawing]()
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(Array(drawings.enumerated()), id: \.element.id) { index, drawing in
                        Circle()
                            .frame(width: 100)
                            .transition(.asymmetric(insertion: .push(from: .trailing), removal: .scale))
//                            .transition(.push(from: .trailing))
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
                .scrollTargetLayout()
            }
            .scrollClipDisabled()
            .scrollTargetBehavior(.viewAligned)
//            .defaultScrollAnchor(UnitPoint.trailing)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .destructive) {
                        withAnimation(.spring) {
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
