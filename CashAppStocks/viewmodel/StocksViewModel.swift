//
//  StocksViewModel.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

@propertyWrapper struct Resolver {
    var wrappedValue: StockUseCase
    private var repo: StockRepository
    
    init() {
        repo = DataStockRepository()
        wrappedValue = StockUseCase(repo: repo)
    }
    
}

struct StocksViewModel: ViewModel {
    typealias dataType = [Stock]
    
    @Resolver
    private var stockUseCase: StockUseCase
    private(set) var state = BehaviorSubject<UIState<dataType>>(value: .loading)
    private let disposeBag = DisposeBag()

    func getStocks(){
        state.onNext(.loading)
        
        stockUseCase.fetchStocks().subscribe { (response) in
            state.onNext(.finished(response))
        } onFailure: { (error) in
            state.onError(error)
        }.disposed(by: disposeBag)
    }
}
