//
//  ResourceData.swift
//  player-demo
//
//  Created by edwin wilson on 19/07/2023.
//

import Foundation

enum HttpMethod: String {
    
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Decodable> {
    let url: URL
    let body: Data?
    let httpMethode: HttpMethod
    
    var request: URLRequest? {
        var request =  URLRequest(url: url)
        request.httpMethod = httpMethode.rawValue
        
        request.httpBody = body
        
        return request
    }
    
    init(forPostRequest url: URL, body: Data?) {
        self.url = url
        self.body = body
        self.httpMethode = .post
    }
    
    init(forGetRequest url: URL) {
        self.url = url
        self.body = nil
        self.httpMethode = .get
    }
}
