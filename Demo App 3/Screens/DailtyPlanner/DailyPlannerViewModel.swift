//
//  DailyPlannerViewModel.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 01/06/2023.
//

import Combine
import Foundation

class DailyPlannerViewModel {
    var quoteRepository: QuoteRepository!
    
    @Published var quoteAuthor: String?
    @Published var quoteText: String?
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        let apiManager = LocalAPIManager()
        quoteRepository = QuoteRepository(apiManager: apiManager)
        getQuote()
    }
    
    func getQuote() {
        quoteRepository.getRandomQuoteFromAPI()
            .sink {
                completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] quote in
                self?.quoteAuthor = quote.author
                self?.quoteText = quote.text
            }
            .store(in: &cancellables)
    }
}
