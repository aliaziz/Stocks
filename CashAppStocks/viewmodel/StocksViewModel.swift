//
//  StocksViewModel.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

public struct StocksViewModel: ViewModel {
    typealias dataType = UIStocks
    
    @disposeInject private var disposeBag: DisposeBag
    @usecaseInject private var stockUseCase: StockUseCase
    private(set) var state = BehaviorSubject<UIState<dataType>>(value: .loading)

    public init() {}
    
    func getStocks() {
        state.onNext(.loading)
        
        stockUseCase.fetchStocks()
            .map({$0.toUIStock()})
            .subscribe { (response) in
            state.onNext(.finished(response))
        } onFailure: { (error) in
            state.onError(error)
        }.disposed(by: disposeBag)
    }
}
