//
//  ContentView.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/12/24.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    @State private var rollValue: Int?
    @State private var rolls = [Roll]()
    @State private var dice = [Die(type: .six), Die(type: .four), Die(type: .hundred)]
    
    let numSides = 6
    
    let columns = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        VStack {
            HistoryView(rolls: rolls)
            
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(dice) { die in
                    DieView(numSides: die.type.rawValue, value: rollValue)
                        .contextMenu {
                            Button("Delete", role: .destructive) {
                                
                            }
                        }
                }
            }
            
//            Button("Roll Dice") {
//                
//            }
//            .font(.title2)
//            .padding(8)
//            .background(Color(hue: 1.0, saturation: 0.006, brightness: 0.226))
//            .foregroundStyle(.white)
//            .clipShape(.buttonBorder)
            
            
            Spacer()
            HStack {
                Button {
                    // does something
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .background(.green)
                        .clipShape(.circle)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .padding()
                
                Spacer()
                
                Button {
                    rollValue = Int.random(in: 1...numSides)
                    if let rollValue {
                        withAnimation {
                            rolls.append(Roll(total: rollValue))
                        }
                    }
                } label: {
                    Image(systemName: "dice")
                        .padding()
                        .background(Color(hue: 1.0, saturation: 0.006, brightness: 0.226))
                        .clipShape(.circle)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .padding()
                .sensoryFeedback(.success, trigger: rollValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
