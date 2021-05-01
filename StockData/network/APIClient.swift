//
//  APIClient.swift
//  StocksDataModule
//
//  Created by ali ziwa on 30/04/2021.
//

import Foundation
import RxSwift

struct APIClient {
    private let decoder: JSONDecoder
    private let urlSession: URLSession
    static let apiClient = APIClient()
    
    private init() {
        /**Choosing to use the shared url session given that we have no specific configurations to set or events to watch out for
         **/
        self.urlSession = URLSession.shared
        self.decoder = JSONDecoder()
    }
    
    func request<T: Codable>(_ endPoint: APIEndpoint = .fetchStocks) -> Single<T> {
        let url = URL(endPoint)
        return Single<T>.create { (observer) in
            let task = urlSession.dataTask(with: url!) { (data, response, error) in
                if let _ = error {
                    observer(.failure(DataError.networkError))
                    return
                }
             
                guard let content = data,
                      let decoded = try? decoder.decode(T.self, from: content) else {
                    observer(.failure(DataError.malformError))
                    return
                }
                observer(.success(decoded))
            }
            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
