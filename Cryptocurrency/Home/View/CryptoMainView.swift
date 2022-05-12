//
//  CryptoMainView.swift
//  Cryptocurrency
//
//  Created by Kate Sychenko on 12.05.2022.
//

import SwiftUI

struct CryptoMainView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
            }
            .font(.headline)
        }
    }
}

struct CryptoMainView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoMainView()
    }
}
