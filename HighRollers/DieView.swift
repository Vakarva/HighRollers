//
//  Die.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/12/24.
//

import SwiftUI

struct DieView: View {
    let die: Die
    
    var displayValue: String {
        if let value = die.value {
            return String(value)
        } else {
            return "?"
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(hue: 1.0, saturation: 0, brightness: 0.9))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.black)
                    )
                    .shadow(radius: 5)
                
                Text(displayValue)
                    .foregroundStyle(.black)
                    .font(.largeTitle)
                    .bold()
            }
            
            Text("D-\(die.type.rawValue)")
                .font(.callout)
//                .offset(x: 40) // half the width of the die
        }
        .padding()
    }
}

#Preview {
    DieView(die: Die(type: .six))
}
