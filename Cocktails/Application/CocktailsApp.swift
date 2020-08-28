//
//  CocktailsApp.swift
//  Shared
//
//  Created by Petar Jadek on 12.08.2020..
//

import SwiftUI

@main
struct CocktailsApp: App {

    var body: some Scene {

        WindowGroup {

            #if targetEnvironment(macCatalyst)
            SidebarView()
            #elseif os(iOS)
            TabbedView()
            #endif

        }
        .commands {
            SidebarCommands()
        }

    }

}
