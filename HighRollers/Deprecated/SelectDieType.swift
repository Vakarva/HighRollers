//
//  SelectDieType.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/15/24.
//

import SwiftUI

struct SelectDieType: View {
    @State var selectedDieType: DieType
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 50) {
                ForEach(DieType.allCases) { dieType in
                    Button {
                        selectedDieType = dieType
                    } label: {
                        DieView(die: Die(type: dieType))
                            .scaleEffect(2)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0 : 0.3)
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.3)
                            }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .safeAreaPadding(.horizontal, 20)
        .scrollTargetBehavior(.viewAligned)
//        .defaultScrollAnchor(.center)
    }
}

#Preview {
    SelectDieType(selectedDieType: DieType.six)
}
