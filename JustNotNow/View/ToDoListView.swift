//  ToDoListView.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import SwiftUI

struct ToDoListView: View {
    
    @Environment(ToDoRepository.self) private var repository
    @State private var searchText = ""
    @State private var isNavigatingToAddForm = false
    
    var body: some View {
        
        NavigationStack {
            
            let filteredItems = repository.filteredItems(matching: searchText)
            if filteredItems.isEmpty {
                ContentUnavailableView(
                    searchText.isEmpty ? "No To-Dos" : "No Results",
                    systemImage: searchText.isEmpty ? "checkmark.circle" : "magnifyingglass",
                    description: Text(searchText.isEmpty ? "Tap + to add your first to-do." : "Try a different search term.")
                )
            }
            
            // MARK: List of Items
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
            .navigationDestination(isPresented: $isNavigatingToAddForm) {
                AddToDoItemView()
            }
            .navigationTitle("Just Not Now")
            .navigationBarTitleDisplayMode(.inline)
            
            // MARK: NavigationBar Search
            .searchable(
                text: $searchText,
                placement: .automatic ,
                prompt: "Search ...")
            
            // MARK: NavigationBar Toolbar
            .toolbar {
                MainToolbar(
                    onAdd: { isNavigatingToAddForm = true },
                    onDeleteAll: { repository.clear() }
                )
            }
            Spacer()
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = repository.filteredItems(matching: searchText)[index]
            repository.delete(item)
        }
    }
}

