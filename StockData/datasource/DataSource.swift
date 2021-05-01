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
    public func fetchStocks() -> Single<[Stock]> {
        let url = URL(.fetchStocks)
        //URL forcefully unwrapped here. Not expected to fail in this case.
        return APIClient.apiClient.request(url!)
    }
}