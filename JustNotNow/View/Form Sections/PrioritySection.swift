//  PrioritySection.swift
//  JustNotNow
//  Created by Holger Hinzberg on 21.04.25.

import SwiftUI

struct PrioritySection: View {
    
    @Binding var item : ToDoItem
    
    var body: some View {
        
        Section(header: Text("Priority")) {
            Picker("Priority", selection: $item.priority) {
                Text("High").tag(3)
                    .foregroundColor(.red)
                Text("Medium").tag(2)
                    .foregroundColor(.yellow)
                Text("Low").tag(1)
                    .foregroundColor(.green)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
