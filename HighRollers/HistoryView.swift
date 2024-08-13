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
                .font(.title)
        }
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
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(rolls) { roll in
                            TotalView(total: roll.total)
                                .visualEffect { content, proxy in
                                    content
                                        .opacity(proxy.frame(in: .global).midX / 150 + 0.2)
                                }
                                .scaleEffect(roll.id == rolls.last?.id ? 1.25 : 1)
                                .padding(roll.id == rolls.last?.id ? 10 : 0)
                        }
                    }
                }
                .padding(.trailing, 10)
                .defaultScrollAnchor(.trailing)
                .scrollClipDisabled(true)
            }
        }
        .background(Color(hue: 0.333, saturation: 0.72, brightness: 0.383))
    }
}

#Preview {
    HistoryView(rolls: [Roll(total: 994), Roll(total: 2), Roll(total: 6), Roll(total: 1)])
}
