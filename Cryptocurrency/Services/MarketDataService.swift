//
//  MarketDataService.swift
//  MoonCut
//
//  Created by Kate Sychenko on 12.05.2022.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketData? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        
        guard let url = URL(string:
                                "https://api.coingecko.com/api/v3/global")
        else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)

            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
        
    }
}
