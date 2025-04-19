//  ToDoListView.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import SwiftUI

struct ToDoListView: View {
    @State private var repository = ToDoRepository()
    
    var body: some View {
        
        VStack {
        
            NavigationView {
                
                // MARK: List of Items
                List {
                    ForEach(repository.sortedByPriority(), id: \.id) { item in
                        ToDoItemView(item: item)
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
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Just Not Now")
                .navigationBarTitleDisplayMode(.inline)
                
                // MARK: Navigation Bar Buttons
                .navigationBarItems(trailing:
                                Button(action: {
                                    repository.addSampleItem()
                                }) {
                                    Image(systemName: "plus.app")
                                        .foregroundColor(.blue)
                                        .font(.title)
                                }
                            )
             
                Spacer()
            }
            
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = repository.items[index]
            repository.delete(item)
        }
    }
}
