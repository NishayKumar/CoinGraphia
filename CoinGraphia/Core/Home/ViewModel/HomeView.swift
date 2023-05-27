//
//  HomeView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 28/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                Text("temp")
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            HomeView()
                .toolbar(.hidden)
        })
    }
}
