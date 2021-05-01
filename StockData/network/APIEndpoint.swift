//
//  APIEndpoint.swift
//  StocksDataModule
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
public enum APIEndpoint: String {
    case fetchStocks = "/portfolio.json"
    case malformed = "/portfolio_malformed.json"
    case empty = "/portfolio_empty.json"
}
