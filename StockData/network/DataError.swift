//
//  DataError.swift
//  StocksDataModule
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
enum DataError: String, Error {
    case malformError = "Invalid data"
    case decodeError = "Error decoding"
    case networkError = "The network misbehaved"
}
