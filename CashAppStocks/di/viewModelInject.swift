//
//  viewModelInject.swift
//  CashAppStocks
//
//  Created by ali ziwa on 01/05/2021.
//

import Foundation

@propertyWrapper struct viewModelInject {
    var wrappedValue: StocksViewModel
    
    init() {
        wrappedValue = StocksViewModel()
    }
    
}
