//
//  HomeViewModel.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 02/06/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistic: [statisticModel] = []
    
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    func addSubscribers() {

        //updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        //updates marketData
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedStats in
                self?.statistic = returnedStats
            }
            .store(in: &cancellables)
        
        //updates portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$saveEntities)
            .map { coinModels, portfolioEntities -> [CoinModel] in
                coinModels
                    .compactMap { coin -> CoinModel? in
                        guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self] returnedCoins in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    private func mapGlobalMarketData(MarketDataModel: MarketDataModel?) -> [statisticModel] {
        var stats: [statisticModel] = []
        
        guard let data = MarketDataModel else {
            return stats
        }
        let marketCap = statisticModel(title: "MarketCap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = statisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = statisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = statisticModel(title: "Portfolio Value", value: "₹0.00", percentageChange: 0)
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}
