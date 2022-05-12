//
//  PortfolioView.swift
//  Cryptocurrency
//
//  Created by Kate Sychenko on 12.05.2022.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("PORTFOLIO VIEW")
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
