//
//  Stocks.swift
//  StockDomain
//
//  Created by ali ziwa on 01/05/2021.
//

import Foundation

public struct Stocks: Codable {
    public let stocks: [StocksItem]
    
    func toUIStock() -> UIStocks {
        var list = [UIStockItem]()
        stocks.forEach { (item) in
            let uistockItem = UIStockItem(companyName: item.name,
                                          ticker: item.ticker,
                                          quantity: item.quantity ?? 0,
                                          date: toStringDate(stamp: item.currentPriceTimestamp),
                                          amount: toFormattedPrice(amount: item.currentPriceCents, currency: Currency.usd.rawValue))
            list.append(uistockItem)
        }
        return UIStocks(stocks: list)
    }
    
    //Could have created an extension
    private func toStringDate(stamp: Double) -> String {
        let date = Date(timeIntervalSince1970: stamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }
    
    private func toFormattedPrice(amount: Double, currency: String) -> String {
        let formatter = NumberFormatter()
        formatter.currencyCode = currency
        formatter.numberStyle = .currency
         
        let number = NSNumber(value: amount)
        return formatter.string(from: number) ?? ""
    }
}
