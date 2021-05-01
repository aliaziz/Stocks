//
//  DataTest.swift
//  DataTest
//
//  Created by ali ziwa on 30/04/2021.
//

import XCTest
import RxTest
import RxBlocking

@testable import StocksDataModule

class DataTest: XCTestCase {
    
    private var repository: StocksRepository?
    private let api = APIClient.apiClient
    private var invalidRequestObserver: TestableObserver<Stock>!
    
    override func setUp() {
        super.setUp()
        repository = StocksRepository()
        
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
