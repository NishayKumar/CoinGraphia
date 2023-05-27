//
//  ContentView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.red
                .ignoresSafeArea()
            
            
            Text("Test Color")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
