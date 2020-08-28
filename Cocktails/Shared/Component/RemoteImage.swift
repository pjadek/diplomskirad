//
//  URLImage.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 15.08.2020..
//

import SwiftUI
import UIKit

struct RemoteImage: View {
    
    let url: URL
    let imageLoader = ImageLoader()
    @State var image: UIImage? = nil

    var body: some View {
        Group {
            makeContent()
        }
        .onReceive(imageLoader.objectWillChange, perform: { image in
            self.image = image
        })
        .onAppear(perform: {
            self.imageLoader.load(url: self.url)
        })
        .onDisappear(perform: {
            self.imageLoader.cancel()
        })
    }

    private func makeContent() -> some View {
        if let image = image {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
        } else {
            return AnyView(Text("🍸"))
        }
    }
}
