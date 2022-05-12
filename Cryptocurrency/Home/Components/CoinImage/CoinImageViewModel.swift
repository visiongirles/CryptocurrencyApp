//
//  CoinImageViewModel.swift
//  MoonCut
//
//  Created by Kate Sychenko on 12.05.2022.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private let dataService: CoinImageService
    private let coin: Coin
    private var cancellables = Set<AnyCancellable>()
    init(coin: Coin) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubscribes()
        self.isLoading = true
    }
    
    private func addSubscribes() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
