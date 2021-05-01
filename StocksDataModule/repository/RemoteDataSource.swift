//
//  RemoteDataSource.swift
//  StocksDataModule
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

public struct RemoteDataSource {
    public init() {}
    public func fetchStocks() -> Single<[Stock]> {
        let url = URL(.fetchStocks)
        //URL forcefully unwrapped here. Not expected to fail in this case.
        return APIClient.apiClient.request(url!)
    }
}
