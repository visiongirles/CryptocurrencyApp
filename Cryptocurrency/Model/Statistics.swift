//
//  StatisticModel.swift
//  MoonCut
//
//  Created by Kate Sychenko on 12.05.2022.
//

import Foundation

struct Statistic: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    //if set default value in init, then there will be 2 options w and w/o this argument
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
