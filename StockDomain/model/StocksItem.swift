//
//  Stock.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation

// MARK: - Stock
public struct StocksItem: Codable {
    let ticker, name: String
    let currency: Currency
    let currentPriceCents: Double
    let quantity: Int?
    let currentPriceTimestamp: Double

    enum CodingKeys: String, CodingKey {
        case ticker, name, currency
        case currentPriceCents = "current_price_cents"
        case quantity
        case currentPriceTimestamp = "current_price_timestamp"
    }
}

enum Currency: String, Codable {
    case usd = "USD"
}

