//  ToDoListView.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import SwiftUI

enum Tabs {
    case toDoList
    case settings
}

struct ToDoListView: View {
    
    @Environment(ToDoRepository.self) private var repository
    @State private var searchText = ""
    @State private var isNavigatingToAddForm = false
    @State private var selectedTab : Tabs = .toDoList
    
    var body: some View {

            NavigationStack {
                // MARK: List of Items
                let filteredItems = repository.filteredItems(matching: searchText)
                List {
                    ForEach(filteredItems , id: \.id) { item in
                        NavigationLink {
                            EditToDoView(item: item)
                        } label: {
                            ToDoListItemView(item: item)
                        }
                        .listRowSeparator(item == filteredItems.last ? .hidden : .visible)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                .navigationTitle("Just Not Now")
                .navigationBarTitleDisplayMode(.inline)
                
                // MARK: NavigationBar Toolbar
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Menu {
                            Button("Item 1", action: {})
                            Button("Item 2", action: {})
                            Button("Item 3", action: {})
                        } label: {
                            Label("Menu", systemImage: "ellipsis")
                                .labelStyle(.iconOnly)
                        }
                    }
                    ToolbarItem(placement: .primaryAction) {
                        Button("Add New", systemImage: "plus") {
                            isNavigatingToAddForm = true
                        }
                        .labelStyle(.iconOnly)
                    }
                }
                .navigationDestination(isPresented: $isNavigatingToAddForm) {
                    AddToDoItemView()
                }
                Spacer()
            }
            .searchable(
                text: $searchText,
                placement: .automatic ,
                prompt: "Search ...")
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = repository.filteredItems(matching: searchText)[index]
            repository.delete(item)
        }
    }
}

