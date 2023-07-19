//
//  NetworkServiceProtocol.swift
//  player-demo
//
//  Created by edwin wilson on 19/07/2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol: AnyObject {

    @discardableResult
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error>
}

/// Errors
enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}
