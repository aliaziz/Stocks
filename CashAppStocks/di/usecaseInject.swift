//
//  Inject.swift
//  CashAppStocks
//
//  Created by ali ziwa on 01/05/2021.
//

import Foundation

@propertyWrapper struct usecaseInject {
    var wrappedValue: StockUseCase
    private var repo: StockRepository
    
    init() {
        repo = DataRepo()
        wrappedValue = StockUseCase(repo: repo)
    }
    
}
