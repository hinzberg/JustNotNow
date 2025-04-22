//  ToDoListView.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import SwiftUI

struct ToDoListView: View {
    
    @State private var repository = ToDoRepository()
    @State private var searchText = ""
    @State private var isNavigatingToAddForm = false
    
    var body: some View {
        
        VStack {
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
                
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search ...")
                
                .navigationTitle("Just Not Now")
                .navigationBarTitleDisplayMode(.inline)
                
                // MARK: Navigation Bar Buttons
                .navigationBarItems(trailing:
                                        Button(action: {
                    isNavigatingToAddForm = true
                }) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.cloudDancer)
                }
                )
                
                .navigationDestination(isPresented: $isNavigatingToAddForm) {
                    AddToDoItemView()
                }
                                
                Spacer()
            }
        }
        .environment(repository) // Put the Repo in the enviroment for all subviews to use
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = repository.filteredItems(matching: searchText)[index]
            repository.delete(item)
        }
    }
}
