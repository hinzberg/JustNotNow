//  MainToolbar.swift
//  JustNotNow
//  Created by Holger Hinzberg on 03.10.25.

import SwiftUI

struct MainToolbar : ToolbarContent {

    let onAdd: () -> Void
    let onDeleteAll: () -> Void
    
    var body: some ToolbarContent{
        
        ToolbarItem(placement: .topBarLeading) {
            Menu {
                Button("Add new", systemImage: "plus") { onAdd() }
                Button("Delete all items", systemImage: "trash") { onDeleteAll() }
            } label: {
                Label("Menu", systemImage: "ellipsis")
                    .labelStyle(.iconOnly)
            }
        }
        ToolbarItem(placement: .primaryAction) {
            Button("Add New", systemImage: "plus") { onAdd() }
            .labelStyle(.iconOnly)
        }
    }
}

