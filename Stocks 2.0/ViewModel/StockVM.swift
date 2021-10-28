//
//  mainVM.swift
//  Stocks 2.0
//
//  Created by Алексей Мотин on 24.10.2021.
//

import Foundation

final class StocksViewModel {
    
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    var stocks: [StockModel] = []
    var onFetchDataSucceed: (() -> Void)?
    var onFetchDataFailure: ((Error) -> Void)?
    
    func fetchAddress () {
        let request = StockRequest()
        networkService.request(request) { result in
            switch result {
            case .success(let stocks):
                self.onFetchDataSucceed?()
                self.stocks = stocks
            case .failure(let error):
                self.onFetchDataFailure?(error)
            }
        }
    }
}
