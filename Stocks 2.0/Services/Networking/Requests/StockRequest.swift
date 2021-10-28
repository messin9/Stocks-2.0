//
//  StockRequest.swift
//  Stocks 2.0
//
//  Created by Алексей Мотин on 24.10.2021.
//
import Foundation

struct StockRequest: DataRequest {
    
    typealias Response = [StockModel]
    
    private let apiKey: String = "pk_31814b353e184d8493520b87df2070c7"
    
    var url: String {
        let baseURL: String = "https://cloud.iexapis.com"
        let path: String = "/stable/stock/market/list/mostactive/"
        return baseURL + path
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
//        [:]
        ["token":apiKey,
//         "ListLimit":"1"
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
}

