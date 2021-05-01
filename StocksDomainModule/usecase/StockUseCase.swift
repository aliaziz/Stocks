//
//  FetchStockUseCase.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

struct StockUseCase {
    private let stockRepo: StockRepository
    init(repo: StockRepository) {
        self.stockRepo = repo
    }
    
    func fetchStocks() -> Single<[Stock]> {
        return stockRepo.fetchLatestStocks()
    }
}
