//
//  UIState.swift
//  CashAppStocks
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
enum UIState<T> {
    case loading
    case finished(T)
    case failed(String)
}
