//
//  MenuRow.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 27.08.2020..
//

import SwiftUI

struct MenuRow: View {
    
    let item: Menu
    
    @Binding var selectedItem: Menu
    
    var isSelected: Bool {
        return selectedItem == item
    }
    
    var body: some View {
        HStack {
            Image(systemName: item.imageName)
            Text(item.title)
                .font(.headline)
                .bold()
            Spacer()
        }
        .padding()
        .onTapGesture {
            self.selectedItem = self.item
        }
    }
}
