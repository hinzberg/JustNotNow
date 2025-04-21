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
            NavigationView {
                
                // MARK: List of Items
                List {
                    ForEach(repository.filteredItems(matching: searchText, ), id: \.id) { item in
                        ToDoItemView(item: item)
                            .frame(maxWidth: .infinity)
                            .listRowInsets(EdgeInsets())
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button {
                                    repository.toggleCompletion(item)
                                } label: {
                                    Label(item.isCompleted ? "Uncomplete" : "Complete",
                                          systemImage: item.isCompleted ? "arrow.uturn.backward.circle" : "checkmark.circle")
                                }
                                .tint(item.isCompleted ? .orange : .green)
                            }
                            .frame( maxWidth: .infinity)
                    }
                    .onDelete(perform: deleteItems)
                    
                    NavigationLink(
                        destination: AddToDoItemView(),
                        isActive: $isNavigatingToAddForm
                    ) {
                        EmptyView()
                    }
                    .hidden() // Keep it invisible until triggered
                    
                    
                }
                .listStyle(PlainListStyle())
                .searchable(text: $searchText)
                .navigationTitle("Just Not Now")
                .navigationBarTitleDisplayMode(.inline)
                
                // MARK: Navigation Bar Buttons
                .navigationBarItems(trailing:
                                        Button(action: {
                    // repository.addSampleItem()
                    isNavigatingToAddForm = true
                }) {
                    Image(systemName: "plus.app")
                        .foregroundColor(.blue)
                        .font(.title)
                }
                )
                Spacer()
            }
        }
        .environment(repository) // Put the Repo in the enviroment for all subviews to use
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = repository.items[index]
            repository.delete(item)
        }
    }
    
    
    
}
