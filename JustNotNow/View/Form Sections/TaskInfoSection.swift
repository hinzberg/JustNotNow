//  TaskInfoSection.swift
//  JustNotNow
//  Created by Holger Hinzberg on 21.04.25.

import SwiftUI

struct TaskInfoSection: View {
    
    @Binding var item : ToDoItem
    
    var body: some View {
        Section(header: Text("Task Info")) {
            TextField("Description", text: $item.itemDescription)
            TextField("Note", text: $item.note)
            TextField("System Image Name", text: Binding($item.imageName, replacingNilWith: ""))
        }
    }
}
