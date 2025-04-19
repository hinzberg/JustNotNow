//  ToDoItemView.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import SwiftUI

struct ToDoItemView: View {
    let item: ToDoItem

    var body: some View {
        HStack {
            if let imageName = item.imageName {
                Image(systemName: imageName)
                    .foregroundColor(item.isCompleted ? .green : .blue)
            }

            VStack(alignment: .leading) {
                Text(item.itemDescription)
                    .font(.headline)
                    .strikethrough(item.isCompleted)
                    .foregroundColor(item.isCompleted ? .green : .primary)

                Text("Priority: \(item.priority)")
                    .font(.subheadline)
                    .strikethrough(item.isCompleted)
                    .foregroundColor(item.isCompleted ? .green : .primary)

                if let date = item.reminderDate {
                    Text("Reminds: \(date.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .strikethrough(item.isCompleted)
                        .foregroundColor(item.isCompleted ? .green : .primary)
                }
            }
        }
    }
}
