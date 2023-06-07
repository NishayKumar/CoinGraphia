//
//  StatisticModel.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 07/06/23.
//

import Foundation


struct statisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    

}
