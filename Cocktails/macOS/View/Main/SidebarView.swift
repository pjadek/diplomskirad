//
//  SidebarView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 27.08.2020..
//

import SwiftUI

enum Menu: Int, CaseIterable, Identifiable {
    var id: Int {
        return self.rawValue
    }
    case discover, categories, ingredients, glasses, alcoholic, search
    
    var title: String {
        switch self {
        case .discover: return Label.Discover.title
        case .categories: return Label.Discover.categories
        case .ingredients: return Label.Discover.ingredients
        case .glasses: return Label.Discover.glasses
        case .alcoholic: return Label.Discover.alcoholic
        case .search: return Label.Search.title
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        switch self {
        case .discover: DiscoverMacView()
        case .categories: CategoryListView(viewModel: CategoryListViewModel())
        case .ingredients: IngredientListView(viewModel: IngredientListViewModel())
        case .glasses: GlassListView(viewModel: GlassListViewModel())
        case .alcoholic: AlcoholicListView(viewModel: AlcoholicListViewModel())
        case .search: SearchView(viewModel: SearchViewModel())
        }
    }
    
    var imageName: String {
        switch self {
        case .discover: return "rectangle.stack.fill"
        case .categories: return "folder.fill"
        case .ingredients: return "chart.bar.doc.horizontal.fill"
        case .glasses: return "star.fill"
        case .alcoholic: return "18.circle.fill"
        case .search: return "magnifyingglass"
        }
    }
}

struct SidebarView: View {
    @State var selection: Menu = .discover
    
    var body: some View {
        HStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(Menu.allCases) { option in
                    ZStack {
                        if selection == option {
                            MenuRow(item: option, selectedItem: $selection)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .cornerRadius(Constants.UI.cornerRadius)
                            
                            
                        } else {
                            MenuRow(item: option, selectedItem: $selection)
                        }
                        
                    }
                }
                .padding(.leading, Constants.UI.spaceSmall)
            }
            .padding(.top)
            .frame(width: 160)
            
            Divider()
            
            selection.contentView
            Spacer()
        }
        .frame(width: 1440, height: 750)

    }
    
}
