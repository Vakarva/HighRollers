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
        VStack {
            Text("History:")
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(rolls) { roll in
                            TotalView(total: roll.total)
                                .scaleEffect(roll.id == rolls.last?.id ? 1.25 : 1)
                                .padding(roll.id == rolls.last?.id ? 10 : 0)
                                .transition(.push(from: .trailing))
                        }
                    }
                }
                .frame(height: 110)
                .padding(.trailing, 10)
                .defaultScrollAnchor(.trailing)
                .scrollClipDisabled(true)
                .fadeOutLeading(isOn: rolls.count > 2)
                .contentMargins(.leading, 10, for: .scrollContent)
            }
        }
        .background(Color(hue: 0.333, saturation: 0.72, brightness: 0.383))
    }
}

#Preview {
    HistoryView(rolls: [Roll(total: 994), Roll(total: 2), Roll(total: 6), Roll(total: 1)])
}
