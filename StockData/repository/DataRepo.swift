//
//  DataRepo.swift
//  StocksDataModule
//
//  Created by ali ziwa on 01/05/2021.
//

import Foundation
import RxSwift

public struct DataRepo: StockRepository {
    public let remoteDataSource = DataSource()
    
    public init() {}
    public func fetchLatestStocks() -> Single<Stocks> {
        return remoteDataSource.fetchStocks()
    }
}
