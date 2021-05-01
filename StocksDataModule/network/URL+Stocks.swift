//
//  URL+Stocks.swift
//  StocksDataModule
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation

extension URL {
    static let baseUrl = "https://storage.googleapis.com/cash-homework/cash-stocks-api"
    
    init?(_ endPoint: APIEndpoint) {
        let rawValue = endPoint.rawValue
        self.init(string: "\(URL.baseUrl)\(rawValue)")
    }
}
