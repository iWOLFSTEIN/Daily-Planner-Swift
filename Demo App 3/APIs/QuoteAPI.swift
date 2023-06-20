//
//  QuoteAPI.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 01/06/2023.
//
import Combine
import Foundation

class QuoteAPI {
    static let shared = QuoteAPI()
    
    private let quotes: [Quote] = [
        Quote(text: "Be yourself; everyone else is already taken.", author: "Oscar Wilde"),
        Quote(text: "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.", author: "Albert Einstein"),
        Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
        Quote(text: "In three words I can sum up everything I've learned about life: it goes on.", author: "Robert Frost"),
        Quote(text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt")
    ]
    
    func getRandomQuote() -> AnyPublisher<Quote, Error> {
        return Future<Quote, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                let randomIndex = Int.random(in: 0..<self.quotes.count)
                let randomQuote = self.quotes[randomIndex]
                promise(.success(randomQuote))
            }
        }
        .eraseToAnyPublisher()
    }
}
