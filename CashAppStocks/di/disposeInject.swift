//
//  disposeInject.swift
//  CashAppStocks
//
//  Created by ali ziwa on 01/05/2021.
//

import RxSwift

@propertyWrapper struct disposeInject {
    var wrappedValue: DisposeBag
    
    init() {
        wrappedValue = DisposeBag()
    }
    
}
