//
//  StockModel.swift
//  Stocks 2.0
//
//  Created by Алексей Мотин on 24.10.2021.
//

import Foundation

struct StockModel: Codable {
    let symbol: String
    let companyName: String
    let latestPrice: Double
    let change : Double
    var imageUrl: String {
    "https://storage.googleapis.com/iex/api/logos/\(symbol).png"
    }
}
