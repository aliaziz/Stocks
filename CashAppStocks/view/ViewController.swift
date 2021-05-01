//
//  ViewController.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    private var stocksViewModel = StocksViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: HomeViewCell.description())
        stocksViewModel.state.subscribe { (response) in
            print(response)
        } onError: { (error) in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
        
        stocksViewModel.getStocks()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.description(), for: indexPath)
        return cell
    }
    
}

extension ViewController: UITableViewDataSource {
    
}

