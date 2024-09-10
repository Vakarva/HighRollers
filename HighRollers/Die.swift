//
//  Dice.swift
//  HighRollers
//
//  Created by Vakarva on 8/13/24.
//

import Foundation

enum DieType: Int, CaseIterable, Identifiable {
    case four = 4, six = 6, eight = 8, ten = 10, twelve = 12, twenty = 20, hundred = 100
    var id: Self { self }
}

struct Die: Equatable, Identifiable {
    var id = UUID()
    var type: DieType
    var value: Int?
    
    mutating func edit(type: DieType) {
        self.type = type
    }
    
    mutating func roll() {
        let numSides = type.rawValue
        value = Int.random(in: 1...numSides)
    }
}
