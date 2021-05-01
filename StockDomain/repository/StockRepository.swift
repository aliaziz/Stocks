//
//  StocksUseCase.swift
//  StocksDomainModule
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

public protocol StockRepository {
    func fetchLatestStocks() -> Single<[Stock]>
}
