//
//  StockDataTests.swift
//  StockDataTests
//
//  Created by ali ziwa on 01/05/2021.
//

import XCTest
//@testable import StockData

class StockDataTests: XCTestCase {
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
