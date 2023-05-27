//
//  CoinGraphiaApp.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 27/05/23.
//

import SwiftUI

@main
struct CoinGraphiaApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                HomeView()
                    .toolbar(.hidden)
            })
        }
    }
}
