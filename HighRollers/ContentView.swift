//
//  ContentView.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/12/24.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    @State private var totalRollValue = 0
    @State private var rolls = [Roll].loadData()
    @State private var dice = [Die(type: .six)]
    @State private var showingAddDialog = false
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        VStack {
            HistoryView(rolls: rolls)
                .contextMenu {
                    Button("Clear History", role: .destructive) {
                        [Roll].clearHistory()
                        withAnimation {
                            rolls = [Roll]()
                        }
                    }
                }
                .padding(.bottom, 20)
            
            Spacer()
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(Array(dice.enumerated()), id: \.element.id) { index, die in
                        DieView(die: die)
                            .contextMenu {
                                Button("Delete", role: .destructive) {
                                    removeDie(at: index)
                                }
                            }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button {
                    showingAddDialog = true
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
                
                Button(action: shakeDice) {
                    Image(systemName: "dice")
                        .padding()
                        .background(Color(hue: 1.0, saturation: 0.006, brightness: 0.226))
                        .clipShape(.circle)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .padding()
                .sensoryFeedback(.success, trigger: totalRollValue)
            }
        }
        .confirmationDialog("Add a die", isPresented: $showingAddDialog) {
            ForEach(DieType.allCases) { dieType in
                Button {
                    addDie(dieType: dieType)
                } label: {
                    Text("\(dieType.rawValue)-sided")
                }
            }
        }
    }
    
    func addDie(dieType: DieType) {
        let die = Die(type: dieType)
        dice.append(die)
    }
    
    func removeDie(at index: Int) {
        dice.remove(at: index)
    }
    
    func rollLoop() {
        totalRollValue = 0
        for index in dice.indices {
            dice[index].roll()
            totalRollValue += dice[index].value ?? 0
        }
    }
    
    func shakeDice() {
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation {
                rollLoop()
            }
            runCount += 1
            
            if runCount > 5 {
                timer.invalidate()
                rollDice()
            }
        }
    }
        
    func rollDice() {
        // get the end values for all dice
        withAnimation {
            rollLoop()
        }
        
        // update history with the total value of the dice
        let roll = Roll(total: totalRollValue)
        withAnimation {
            rolls.append(roll)
        }
        rolls.saveData()    // save to disk
    }
}

#Preview {
    ContentView()
}
