//
//  CryptocurrencyApp.swift
//  Cryptocurrency
//
//  Created by Kate Sychenko on 12.05.2022.
//

import SwiftUI

@main
struct CryptocurrencyApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
