//
//  Dice.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/13/24.
//

import Foundation

enum DieType: Int, CaseIterable, Identifiable {
    case four = 4, six = 6, eight = 8, ten = 10, twelve = 12, twenty = 20, hundred = 100
    var id: Self { self }
}

struct Die: Identifiable {
    var id = UUID()
    let type: DieType
    var value: Int?
    
    mutating func roll() {
        let numSides = type.rawValue
        value = Int.random(in: 1...numSides)
    }
}
