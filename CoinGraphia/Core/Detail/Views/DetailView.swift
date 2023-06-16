//
//  DetailView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 14/06/23.
//

import SwiftUI

struct DetailedLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}


struct DetailView: View {
    @StateObject var vm: DetailViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initializing Detail View for \(coin.name)")
    }
    var body: some View {
        Text("Hello")
    }

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
