// https://www.createwithswift.com/adapting-search-to-the-liquid-glass-design-system/

import SwiftUI

struct PlaygroundView: View {
    @State var text: String = ""
    
    var body: some View {
        TabView {
            Tab {
                Color.teal.ignoresSafeArea()
            } label: {
                Label("Tab 1", systemImage: "1.circle")
            }
            
            Tab {
                Color.pink.ignoresSafeArea()
            } label: {
                Label("Tab 2", systemImage: "2.circle")
            }
            
            Tab(role: .search) {
                SearchView()
            }
        }
    }
}

struct SearchView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ContentUnavailableView("Search Tab", systemImage: "magnifyingglass")
            }
            .navigationTitle("Search")
        }
        .searchable(
            text: $searchText,
            placement: .automatic,
            prompt: "type here to search"
        )
    }
    
}

#Preview {
    PlaygroundView()
}
