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
    
    override func setUp() {
        super.setUp()
        repository = DataRepo()
    }
    
    func testInvalidData() {
        do {
            let result: [Stocks] = try api.request(.malformed).toBlocking().toArray()
            XCTAssertFalse(!result.isEmpty)
        } catch {
            XCTAssertTrue(true)
        }
    }
    
    func testEmptyData() {
        do {
            let result: Stocks = try api.request(.empty).toBlocking().first()!
            XCTAssertTrue(result.stocks.isEmpty)
        } catch {
            XCTAssertFalse(false)
        }
    }
}
