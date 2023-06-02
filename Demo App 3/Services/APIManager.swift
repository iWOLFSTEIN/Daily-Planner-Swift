//
//  APIManager.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 01/06/2023.
//

import Combine
import Foundation

protocol APIManager {
    func performRequest<T>(on api: AnyPublisher<T, Error>) -> AnyPublisher<T, Error>
}

class LocalAPIManager: APIManager {
    
    func performRequest<T>(on api: AnyPublisher<T, Error>) -> AnyPublisher<T, Error> {
        return api
            .tryMap { value -> T in
                return value
            }
            .eraseToAnyPublisher()
    }
}
