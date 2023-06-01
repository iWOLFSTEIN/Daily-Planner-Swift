//
//  QuoteRepository.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 01/06/2023.
//

import Combine
import Foundation

class QuoteRepository {
    var apiManager: APIManager!
    
    init(apiManager: APIManager!) {
        self.apiManager = apiManager
    }
    
    func getRandomQuoteFromAPI() -> AnyPublisher<Quote, Error> {
        let api: AnyPublisher<Quote, Error> = QuoteAPI.shared.getRandomQuote()
        return apiManager.performRequest(on: api)
    }
}
