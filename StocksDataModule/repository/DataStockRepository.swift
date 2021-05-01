//
//  StocksRepository.swift
//  StocksDataModule
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

public struct DataStockRepository: StockRepository {
    private let remoteDataSource = RemoteDataSource()
    
    public init() {}
    public func fetchLatestStocks() -> Single<[Stock]> {
        return remoteDataSource.fetchStocks()
    }
}
