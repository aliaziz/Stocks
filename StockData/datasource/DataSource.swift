//
//  DataSource.swift
//  StocksDataModule
//
//  Created by ali ziwa on 01/05/2021.
//

import Foundation
import RxSwift

public struct DataSource {
    public init() {}
    public func fetchStocks() -> Single<Stocks> {
        return APIClient.apiClient.request(.fetchStocks)
    }
}
