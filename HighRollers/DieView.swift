//
//  Die.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/12/24.
//

import SwiftUI

//extension HorizontalAlignment {
//    private enum DieCorner: AlignmentID {
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//            context[HorizontalAlignment.center]
//        }
//    }
//    
//    static let dieCorner = HorizontalAlignment(DieCorner.self)
//}

struct DieView: View {
    let numSides: Int
    let value: Int?
    
    var displayValue: String {
        if let value {
            return String(value)
        } else {
            return "?"
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(hue: 1.0, saturation: 0, brightness: 0.9))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.black)
                    )
                
                Text(displayValue)
                    .font(.largeTitle)
                    .bold()
            }
            
//            Text("D-\(numSides)")
//                .font(.callout)
//                .offset(x: 40) // half the width of the die
        }
    }
}

#Preview {
    DieView(numSides: 6, value: nil)
}
