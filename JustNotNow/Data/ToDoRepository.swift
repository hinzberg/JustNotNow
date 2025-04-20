//  ToDoRepository.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import Foundation
import Observation

@Observable
class ToDoRepository {
    private(set) var items: [ToDoItem] = []
        
    init() {
        items = [
            ToDoItem(itemDescription: "Buy groceries", imageName: "cart", priority: 2, reminderDate: Date().addingTimeInterval(3600)),
            ToDoItem(itemDescription: "Walk the dog", imageName: "pawprint", priority: 1, reminderDate: nil),
            ToDoItem(itemDescription: "Finish SwiftUI project", imageName: "laptopcomputer", priority: 3, reminderDate: Date().addingTimeInterval(86400)),
            ToDoItem(itemDescription: "Call Mom", imageName: "phone", priority: 2, reminderDate: Date().addingTimeInterval(7200)),
            ToDoItem(itemDescription: "Read a book", imageName: "book", priority: 1, reminderDate: nil)
        ]
    }
    
    func addSampleItem() {
        let newItem = ToDoItem(
            itemDescription: "Sample Task",
            imageName: "checkmark.circle",
            priority: Int.random(in: 1...3),  // Random priority between 1 and 3
            reminderDate: Date().addingTimeInterval(3600)  // A reminder set 1 hour from now
        )
        items.append(newItem)
    }
    
    func sortedByPriority() -> [ToDoItem] {
        return items.sorted { $0.priority > $1.priority }
    }
    
    func filteredItems(matching filter: String) -> [ToDoItem] {
        guard !filter.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return items.sorted { $0.priority > $1.priority }
        }
        
        let filtered = items.filter { $0.matchesFilter(filter) }
        return filtered.sorted { $0.priority > $1.priority }
    }

    func add(_ item: ToDoItem) {
        items.append(item)
    }

    func delete(_ item: ToDoItem) {
        items.removeAll { $0.id == item.id }
    }
    
    func toggleCompletion(_ item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
}
