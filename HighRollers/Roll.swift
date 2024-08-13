//
//  Roll.swift
//  HighRollers
//
//  Created by Vahe Vartan on 8/12/24.
//

import Foundation

struct Roll: Codable, Identifiable {
    var id = UUID()
    let total: Int
}
