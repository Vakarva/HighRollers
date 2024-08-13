//
//  Dice.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/13/24.
//

import Foundation

enum DieType: Int {
    case four = 4, six = 6, eight = 8, ten = 10, twelve = 12, twenty = 20, hundred = 100
}

struct Die: Identifiable {
    var id = UUID()
    let type: DieType
}

//struct Dice {
//    var diceCollection: [DieType]
//    
//    mutating func addDie(die: DieType) {
//        diceCollection.append(die)
//    }
//    
//    mutating func removeDie() {
//        diceCollection.remove(at: <#T##Int#>)
//    }
//}
