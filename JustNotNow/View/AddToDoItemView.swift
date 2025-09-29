//  ToDoItemFormView.swift
//  JustNotNow
//  Created by Holger Hinzberg on 21.04.25.

import SwiftUI

struct AddToDoItemView: View {
    
    @Environment(ToDoRepository.self) var repository
    @Environment(\.dismiss) var dismiss
    
    @State private var item = ToDoItem(
        itemDescription: "test",
        note: "note",
        priority: 1,
        reminderDate: nil,
        isCompleted: false
    )
    
    var body: some View {
        
        Form {
            TaskInfoSection(item: $item)
            SymbolSection(item: $item)
            PrioritySection(item: $item)
            ReminderSection(item: $item)
        }
        .navigationTitle("New To-Do")
        
        HStack {
            Button() {
                dismiss()
            } label: {
                Text("Cancel")
                    .frame(width: 150)
            }
            .buttonStyle(.glass)
            .tint(.red)
            
            Button() {
                repository.add(item)
                dismiss()
            } label: {
                Text("Save")
                    .frame(width: 150)
            }
            .buttonStyle(.glass)
            .tint(.green)
        }
    }
}

extension Binding {
    init(_ source: Binding<Value?>, replacingNilWith defaultValue: Value) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { source.wrappedValue = $0 }
        )
    }
}
