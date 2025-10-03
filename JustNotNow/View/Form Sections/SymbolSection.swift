//  IconSection.swift
//  JustNotNow
//  Created by Holger Hinzberg on 01.05.25.

import SwiftUI

struct SymbolSection: View {
    
    @Binding var item: ToDoItem
    @State private var showingSymbolPicker = false
    
    var body: some View {
        Section(header: Text("Symbol")) {
            HStack {
                Spacer()
                Image(systemName: item.imageName )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(8)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showingSymbolPicker = true
            }
            // Sheet
            .sheet(isPresented: $showingSymbolPicker) {
                SymbolPickerView(selectedSymbol: Binding(
                    get: { item.imageName },
                    set: { item.imageName = $0 }
                ))
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
            }
        }
    }
}
