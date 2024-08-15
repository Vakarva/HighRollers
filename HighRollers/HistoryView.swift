//
//  HistoryView.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/13/24.
//

import SwiftUI

struct TotalView: View {
    let total: Int
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.white)
                .overlay(
                    Circle()
                        .stroke(.black, lineWidth: 1)
                )
                .frame(width: 70, height: 70)
                .padding(.vertical, 1)
                .shadow(radius: 5)
            
            Circle()
                .foregroundStyle(.white)
                .overlay(
                    Circle()
                        .stroke(.black, lineWidth: 1)
                )
                .frame(width: 63, height: 63)
            
            Text(total, format: .number)
                .foregroundStyle(.black)
                .font(.title)
        }
    }
}


// Idea from https://stackoverflow.com/questions/63873033/swiftui-fade-out-a-scrollview
extension View {
    func fadeOutLeading(isOn: Bool) -> some View {
        return self.mask(
            HStack(spacing: 0) {
                LinearGradient(gradient:
                    Gradient(colors: [Color.black.opacity(isOn ? 0 : 1), Color.black]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 150)
            
                Rectangle().fill(Color.black)
            }
        )
    }
}

struct HistoryView: View {
    let rolls: [Roll]
    
    var body: some View {
        let hSpacing = 8.0
        let scaleAmount = 1.25
        
        VStack {
            Text("History:")
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: hSpacing) {
                    ForEach(rolls) { roll in
                        TotalView(total: roll.total)
                            .scaleEffect(roll.id == rolls.last?.id ? scaleAmount : 1)
                            .offset(x: roll.id == rolls.last?.id ? hSpacing * scaleAmount : 0)
                            .transition(.push(from: .trailing))
                    }
                }
            }
            .frame(height: 110)
            .safeAreaPadding(.leading, 5)
            .safeAreaPadding(.trailing, 30)
            .scrollClipDisabled(true)
            .fadeOutLeading(isOn: rolls.count > 2)
            .defaultScrollAnchor(.trailing)
        }
        .background(Color(hue: 0.333, saturation: 0.72, brightness: 0.383))
    }
}

#Preview {
    HistoryView(rolls: [Roll(total: 994), Roll(total: 2), Roll(total: 6), Roll(total: 1)])
}
