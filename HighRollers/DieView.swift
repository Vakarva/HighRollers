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
        switch die.type {
        case .four:
            D4()
        case .six:
            D6()
        case .eight:
            D8()
        case .ten:
            D10()
        case .twelve:
            D12()
        case .twenty:
            D20()
        case .hundred:
            D100()
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

struct D8: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundStyle(Color(hue: 0.782, saturation: 0.437, brightness: 0.969))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black)
            )
    }
}

struct D10: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundStyle(Color(hue: 0.156, saturation: 0.622, brightness: 0.935))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black)
            )
    }
}

struct D12: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundStyle(Color(hue: 0.522, saturation: 0.524, brightness: 0.981))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black)
            )
    }
}

struct D20: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundStyle(Color(hue: 0.083, saturation: 0.685, brightness: 1.0))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black)
            )
    }
}

struct D100: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundStyle(Color(hue: 0.31, saturation: 0.735, brightness: 0.917))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black)
            )
    }
}

#Preview {
    DieView(die: Die(type: .six))
}
