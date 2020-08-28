//
//  CategoryListView.swift
//  Cocktails
//
//  Created by Petar Jadek on 17.08.2020..
//

import SwiftUI

struct CategoryListView: View {
    
    @ObservedObject var viewModel: CategoryListViewModel
    
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
                    
                    ForEach(viewModel.categories) { category in
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
                
                DrinksListView(viewModel: DrinksListViewModel(key: "c", value: selected))
            }
        }
        .padding(.top)
    }
    
    #else
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(viewModel.categories) { category in
                NavigationLink(destination: DrinksListView(viewModel: DrinksListViewModel(key: "c", value: category.name))) {
                    ListRowView(title: category.name)
                }
            }
            .navigationTitle(Label.Discover.categories)
            .padding(.top)
        }
    }
    
    #endif
}
