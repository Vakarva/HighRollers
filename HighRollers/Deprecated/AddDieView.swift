//
//  AddDieView.swift
//  HighRollers
//
//  Created by Vakarva on 8/13/24.
//
// ***DEPRECATED***

import SwiftUI

struct AddDieView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedDieType = DieType.six
    
    let addDie: (DieType) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select die type:", selection: $selectedDieType) {
                    ForEach(DieType.allCases) { dieType in
                        Text("\(dieType.rawValue)-sided")
                    }
                }
                
                Button("Add") {
                    addDie(selectedDieType)
                    dismiss()
                }
            }
            .navigationTitle("Add Die")
            .toolbar {
                ToolbarItem(id: "Cancel", placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddDieView(addDie: { _ in })
}
