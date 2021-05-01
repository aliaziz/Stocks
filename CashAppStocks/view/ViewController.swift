//
//  ViewController.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var stocksViewModel = StocksViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        stocksViewModel.state.subscribe { (response) in
            state.onNext(.finished(response))
        } onFailure: { (error) in
            state.onError(error)
        }.disposed(by: disposeBag)
        
        stocksViewModel.getStocks()
    }


}

