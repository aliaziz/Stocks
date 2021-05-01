//
//  FetchStockUseCase.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

public struct StockUseCase {
    private let stockRepo: StockRepository
    public init(repo: StockRepository) {
        self.stockRepo = repo
    }
    
    public func fetchStocks() -> Single<[Stock]> {
        return stockRepo.fetchLatestStocks()
    }
}
