//
//  MoreScrollViewTesting.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/15/24.
//

import SwiftUI

struct MoreScrollViewTesting: View {
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 3) {
                    ForEach(0..<10) { num in
                        Circle()
                            .frame(width: 200)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                content
                                    .scaleEffect(
                                        x: phase.isIdentity ? 1.0 : 0.80,
                                        y: phase.isIdentity ? 1.0 : 0.80
                                    )
                            }
                    }
                }
                .scrollTargetLayout()
                // Need to use this with Lazy Stacks because the lazy stack doesn't know what's coming next and therefore doesn't know ahead of time what is a scrollTarget.  If you are using non-lazy stacks, you can use the scrollTarget modifier on individual objects
            }
            .contentMargins(.horizontal, 8)
            .scrollTargetBehavior(GalleryScrollTargetBehavior())
        }
    }
}

struct GalleryScrollTargetBehavior: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
//        if target.rect.minX < (context.containerSize.width / 3.0), context.velocity.dx < 0.0 {
//            target.rect.origin.x = 100.0
//        }
        if context.velocity.dx < 0 {
            target.rect.origin.x = context.originalTarget.rect.minX
        }
    }
}

#Preview {
    MoreScrollViewTesting()
}
