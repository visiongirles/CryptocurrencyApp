//
//  StatisticView.swift
//  Cryptocurrency
//
//  Created by Kate Sychenko on 12.05.2022.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: Statistic

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees:(stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor(((stat.percentageChange ?? 0 ) >= 0) ? Color.theme.green : Color.theme.red)
            .opacity((stat.percentageChange == nil) ? 0.0: 1.0)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.state1)
            StatisticView(stat: dev.state2)
            StatisticView(stat: dev.state3)
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
