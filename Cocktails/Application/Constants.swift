//
//  Constants.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 12.08.2020..
//

import Foundation
import SwiftUI

struct Constants {
    
    struct UI {

        /// This metric is used for making spacing, padding and margins
        /// It comes in three main sizes: default, small and large
        static let spaceRegular: CGFloat = 20.0
        static let spaceSmall: CGFloat = 10.0
        static let spaceLarge: CGFloat = 40.0
        
        /// Cocktail image size
        /// Also used for ingredients!
        /// Images should have same width and height
        /// It comes in sizes: default, small and large
        static let cocktailImageSizeRegular: CGFloat = 120.0
        static let cocktailImageSizeSmall: CGFloat = 50.0
        static let cocktailImageSizeLarge: CGFloat = 160.0
        
        /// Card size
        static let cardHeight: CGFloat = 80.0
        static let cardWidth: CGFloat = 160.0
        
        /// Corner radius
        /// Applied to all corners in the app
        static let cornerRadius: CGFloat = 10.0
        
        /// Tags design
        static let cornerRadiusTag: CGFloat = 5.0
        static let paddingTag: CGFloat = 5.0
        
        /// Row cells
        static let rowImageSize: CGFloat = 50.0
        
        /// Experience image height, width should be full device width minus padding
        static let experienceImageHeight: CGFloat = 450.0

    }
    
}
