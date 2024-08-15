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
                SelectDie(die: die)
                    .frame(width: 80, height: 80)
                    .shadow(radius: 5)
                
                Text(displayValue)
                    .foregroundStyle(.black)
                    .font(.largeTitle)
                    .bold()
            }
            
            Text("D-\(die.type.rawValue)")
                .font(.callout)
        }
        .padding()
    }
}

struct SelectDie: View {
    let die: Die
    
    var body: some View {
        if die.type == .four {
            D4()
        } else {
            D6()
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let heightScale = rect.maxX * Double(3).squareRoot() / 2.0
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: heightScale))
        path.addLine(to: CGPoint(x: rect.maxX, y: heightScale))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct D4: View {
    var body: some View {
        Triangle()
            .foregroundStyle(Color(hue: 1.0, saturation: 0.419, brightness: 0.951))
            .overlay(
                Triangle()
                    .stroke(.black)
            )
    }
}

struct D6: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundStyle(Color(hue: 1.0, saturation: 0, brightness: 0.9))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black)
            )
    }
}

#Preview {
    DieView(die: Die(type: .six))
}
