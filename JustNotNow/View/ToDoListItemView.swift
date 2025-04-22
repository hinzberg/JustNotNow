//  ToDoItemView.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import SwiftUI

struct ToDoListItemView: View {
    
    @Environment(ToDoRepository.self) var repository
    let item: ToDoItem
    
    var body: some View {
        HStack {
            
            // MARK: Colored rectangle based on priority
            Rectangle()
                .fill(priorityColor(for: item.priority))
                .frame(width: 15)
                .cornerRadius(5)
                .padding(EdgeInsets(top: 0, leading: 0 , bottom: 0, trailing: 10))
            
            if let imageName = item.imageName {
                Image(systemName: imageName)
                    .foregroundColor(item.isCompleted ? .green : .primary)
                    .font(.system(size: 25))
                    .padding(EdgeInsets(top: 0, leading: 0 , bottom: 0, trailing: 10))
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
            Spacer()
        }
        .frame(maxWidth: .infinity)  // Ensure the HStack takes up the full width
        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
        .listRowInsets(EdgeInsets())
        .frame( maxWidth: .infinity)
        
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            Button {
                repository.toggleCompletion(item)
            } label: {
                Label(item.isCompleted ? "Uncomplete" : "Complete",
                      systemImage: item.isCompleted ? "arrow.uturn.backward.circle" : "checkmark.circle")
            }
            .tint(item.isCompleted ? .orange : .green)
        }
        
    }
    
    // Helper function to return the color based on priority
    private func priorityColor(for priority: Int) -> Color {
        switch priority {
        case 3:
            return .red  // Red for priority 3
        case 2:
            return .yellow  // Yellow for priority 2
        case 1:
            return .green  // Green for priority 1
        default:
            return .gray  // Default color if priority is undefined
        }
    }
    
}
