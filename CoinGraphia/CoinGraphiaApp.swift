//
//  CoinGraphiaApp.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 27/05/23.
//

import SwiftUI

@main
struct CoinGraphiaApp: App {
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
           UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
           UITableView.appearance().backgroundColor = UIColor.clear
       }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                NavigationView(content: {
                    HomeView()
                        .toolbar(.hidden)
                })
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .top))
                    }
                }
                .zIndex(2.0)
            }
            
            
            
        }
    }
}
