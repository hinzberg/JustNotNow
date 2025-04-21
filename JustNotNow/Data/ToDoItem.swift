//  ToDoItem.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import Foundation

struct ToDoItem: Identifiable, Hashable {
    let id = UUID()
    var itemDescription: String
    var note: String = ""
    var imageName: String? = "book"
    var priority: Int
    var reminderDate: Date?
    var isCompleted: Bool = false
    
    func matchesFilter(_ filter: String) -> Bool {
            let lowercasedFilter = filter.lowercased()
            return itemDescription.lowercased().contains(lowercasedFilter) ||
                   note.lowercased().contains(lowercasedFilter)
        }
}
