//
//  ViewController.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var homeTableView: UITableView!
    
    @viewModelInject private var stocksViewModel: StocksViewModel
    @disposeInject private var disposeBag: DisposeBag
    private var stocksData = [UIStockItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stocksViewModel.state
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] (response) in
            self?.handleResponse(response: response)
        } onError: { [weak self] (error) in
            let err = error as? DataError
            self?.displayError(with: err?.rawValue ?? error.localizedDescription)
        }.disposed(by: disposeBag)
        
        stocksViewModel.getStocks()
    }
    
    private func displayError(with msg: String) {
        let alert = UIAlertController.init(title: "Oops", message: msg, preferredStyle: .alert)
        self.present(alert, animated: true)
    }
    
    private func handleResponse(response: UIState<UIStocks>) {
        switch response {
        case .failed(let error):
            displayError(with: error)
        case .finished(let stocks):
            displayStocks(stocks)
        case .loading:
            toggleLoader(show: true)
        }
    }
    
    private func displayStocks(_ stocks: UIStocks) {
        toggleLoader(show: false)
        stocksData = stocks.stocks
        if stocksData.isEmpty { displayError(with: "No available stock data")}
        homeTableView.reloadData()
    }
    
    private func toggleLoader(show: Bool) {
        homeTableView.isHidden = show
        activityIndicator.isHidden = !show
        show ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StocksTableViewCell {
            let stockItem = stocksData[indexPath.row]
            print(cell)
            cell.companyLabel.text = stockItem.companyName
            cell.tickerLabel.text = stockItem.ticker
            cell.quantityLabel.text = String("Qty: \(stockItem.quantity)")
            cell.amountLabel.text = stockItem.amount
            return cell
        }
        fatalError("Error constructing table cell ⚰️")
    }
    
}

extension ViewController: UITableViewDataSource {
    
}

