//
//  ViewController.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private var stocksViewModel = StocksViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksViewModel.state.subscribe { (response) in
            print(response)
        } onError: { (error) in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
        
        stocksViewModel.getStocks()
    }


}

