//
//  Roll.swift
//  HighRollers
//
//  Created by Varkva on 8/12/24.
//

import Foundation

struct Roll: Codable, Identifiable {
    var id = UUID()
    let total: Int
}

extension [Roll] {
    private static let savePath = URL.documentsDirectory.appending(path: "Rolls.txt")
    
    static func clearHistory() {
        let emptyHistory = [Roll]()
        emptyHistory.saveData() // saves an empty Roll array to clear history
    }
    
    static func loadData() -> [Roll] {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Roll].self, from: data) {
                return decoded
            }
        }
        
        return [Roll]()
    }
    
    func saveData() {
        do {
            let encoded = try JSONEncoder().encode(self)
            try encoded.write(to: [Roll].savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
}
