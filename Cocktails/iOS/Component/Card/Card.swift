//
//  Card.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 13.08.2020..
//

import SwiftUI

struct Card: View {
    
    var title: String
    
    var body: some View {
        
        ZStack {
            
            Image(title)
                .frame(width: Constants.UI.cardWidth, height: Constants.UI.cardHeight)
                .cornerRadius(Constants.UI.cornerRadius)
            
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
        }
        .padding([.top, .bottom])
        
    }
    
}
