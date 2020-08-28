//
//  ListRowView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 24.08.2020..
//

import SwiftUI

struct ListRowView: View {
    
    var title: String
    var image: RemoteImage?
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                if image != nil {
                    image
                        .frame(
                            width: Constants.UI.rowImageSize,
                            height: Constants.UI.rowImageSize)
                        .cornerRadius(Constants.UI.cornerRadius)
                        .padding(.trailing)
                        .foregroundColor(.accentColor)
                } else {
                    Rectangle()
                        .frame(
                            width: Constants.UI.rowImageSize,
                            height: Constants.UI.rowImageSize)
                        .cornerRadius(Constants.UI.cornerRadius)
                        .padding(.trailing)
                        .foregroundColor(.accentColor)
                }
                
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.accentColor)
                
            }
            .padding([.leading, .trailing])
            
            Divider()
                .padding([.leading, .trailing])
            
        }
        
    }
    
}
