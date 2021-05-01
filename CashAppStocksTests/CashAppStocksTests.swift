//
//  CashAppStocksTests.swift
//  CashAppStocksTests
//
//  Created by ali ziwa on 30/04/2021.
//

import XCTest
import RxTest
import RxBlocking
//@testable import CashAppStocks
@testable import StockData

class CashAppStocksTests: XCTestCase {
    private var repository: DataRepo?
    private let api = APIClient.apiClient
    private var invalidRequestObserver: TestableObserver<Stock>!
    
    override func setUp() {
        super.setUp()
        repository = DataRepo()
        
        let scheduler = TestScheduler(initialClock: 0)
        invalidRequestObserver = scheduler.createObserver(Stock.self)
    }
    
    func testInvalidData() {
        let url = URL(string: "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json")
        _ = api.request(url!)
            .asObservable()
            .subscribe(invalidRequestObserver)
        repository?.fetchLatestStocks().subscribe()
        print(invalidRequestObserver.events)
    }
}
