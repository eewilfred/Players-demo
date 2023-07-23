//
//  ImageLoaderServiceProtocol.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import Combine
import UIKit

protocol ImageLoaderServiceProtocol: AnyObject {
    
    func loadImage(from url: URL) -> AnyPublisher<UIImage?, Never>
    
    // To avoid thread switching delays if already present
    func getCachedImage(url: URL) -> UIImage?
}
