//
//  ToDoItemFormView.swift
//  JustNotNow
//
//  Created by Holger Hinzberg on 21.04.25.
//

import SwiftUI

struct ToDoItemFormView: View {
    
    @Binding var item : ToDoItem
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Task Info")) {
                TextField("Description", text: $item.itemDescription)
                TextField("Note", text: $item.note)
            }

            Section(header: Text("Priority")) {
                Picker("Priority", selection: $item.priority) {
                    Text("1 (Low)").tag(1)
                    Text("2 (Medium)").tag(2)
                    Text("3 (High)").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Reminder")) {
                Toggle("Set Reminder", isOn: Binding(
                    get: { item.reminderDate != nil },
                    set: { useReminder in
                        item.reminderDate = useReminder ? Date() : nil
                    }
                ))

                if item.reminderDate != nil {
                    DatePicker("Reminder Date", selection: Binding($item.reminderDate, replacingNilWith: Date()), displayedComponents: [.date, .hourAndMinute])
                }
            }

            Section {
                Toggle("Completed", isOn: $item.isCompleted)
            }

            /*
            Section {
                Button("Save") {
                    repository.add(item)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            */
        }
    }
}

/*
#Preview {
    ToDoItemFormView()
}
*/
