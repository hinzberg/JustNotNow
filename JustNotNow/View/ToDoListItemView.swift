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
                .fill(priorityColor(for: item))
                .frame(width: 15)
                .cornerRadius(5)
                .padding(EdgeInsets(top: 0, leading: 0 , bottom: 0, trailing: 10))
            
            Image(systemName: item.imageName)
                .foregroundColor(item.isCompleted ? .secondary : .primary)
                .font(.system(size: 25))
                .padding(EdgeInsets(top: 0, leading: 0 , bottom: 0, trailing: 10))
            
            VStack(alignment: .leading) {
                Text(item.itemDescription)
                    .font(.headline)
                    .foregroundColor(item.isCompleted ? .secondary : .primary)
                
                Text("Priority: \(item.priority)")
                    .font(.subheadline)
                    .foregroundColor(item.isCompleted ? .secondary : .primary)
                
                if let date = item.reminderDate {
                    Text("Reminds: \(date.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundColor(item.isCompleted ? .secondary : .primary)
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
    private func priorityColor(for item: ToDoItem) -> Color {
        
        if  item.isCompleted == true {
            return Color.secondary
        }
                
        switch item.priority {
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
