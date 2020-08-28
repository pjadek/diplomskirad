//
//  GlassListView.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import SwiftUI

struct GlassListView: View {
    
    @ObservedObject var viewModel: GlassListViewModel
    
    #if targetEnvironment(macCatalyst)
    
    @State var selected = ""
    
    var body: some View {
        HStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    Text(Label.Discover.categories)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                    
                    ForEach(viewModel.glasses) { category in
                        ListRowView(title: category.name)
                            .onTapGesture {
                                selected = category.name
                            }
                    }
                    .navigationTitle(Label.Discover.categories)
                    .padding(.top)
                }
            }
            
            if selected != "" {
                Divider()
                
                DrinksListView(viewModel: DrinksListViewModel(key: "g", value: selected))
            }
        }
        .padding(.top)
    }
    
    #else
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(viewModel.glasses) { category in
                NavigationLink(destination: DrinksListView(viewModel: DrinksListViewModel(key: "g", value: category.name))) {
                    ListRowView(title: category.name)
                }
            }
            .navigationTitle(Label.Discover.glasses)
            .padding(.top)
        }
    }
    
    #endif
    
}
