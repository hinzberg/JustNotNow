//  ToDoItem.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import Foundation

struct ToDoItem: Identifiable, Hashable {
    let id = UUID()
    var itemDescription: String
    var imageName: String?
    var priority: Int
    var reminderDate: Date?
    var isCompleted: Bool = false
}
