//
//  TabView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 13.08.2020..
//

import SwiftUI

struct TabbedView: View {
    
    var body: some View {
        
        TabView {
            
            DiscoverView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text(Label.Discover.title)
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(Label.Search.title)
                }


        }
        
    }
    
}
