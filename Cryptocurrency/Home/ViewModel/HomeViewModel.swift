//
//  HomeViewModel.swift
//  MoonCut
//
//  Created by Kate Sychenko on 12.05.2022.
//

import Foundation
import Combine
import UIKit

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistic] = []
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    init() {
        
        addSubscribes()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //         self.allCoins.append(DeveloperPreview.instance.coin)
            //       self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
    
    func addSubscribes() {
        coinDataService.$allCoins
            .sink { [weak self](returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // updates the market data
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnStats) in
                self?.statistics = returnStats
            }
            .store(in: &cancellables)
        
        // updates allCoins

        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // <- in order not to run func immidiately after each letter tiped
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else { return coins }
        let lowercasedText = text.lowercased()
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    
    private func mapGlobalMarketData(marketData: MarketData?) -> [Statistic] {
            var stats: [Statistic] = []
            guard let data = marketData else { return stats }
            let marketCap = Statistic(title: "MarketCap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
            let volume = Statistic(title: "24h Volume", value: data.volume)
            let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
            let portfolio = Statistic(title: "Portfolio", value: "$ 0.00", percentageChange: 0)
            stats.append(contentsOf: [
                marketCap,
                volume,
                btcDominance,
                portfolio
            ])
        return stats
    }
}
