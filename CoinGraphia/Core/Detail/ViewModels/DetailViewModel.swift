//
//  DetailViewModel.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 17/06/23.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinsDetails in
                print("RECEIVED COIN DETAIL DATA")
                print(returnedCoinsDetails)
            }
            .store(in: &cancellables)
    }
}
