//
//  ImageLoaderService.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import Foundation
import UIKit.UIImage
import Combine

final class ImageLoaderService: ImageLoaderServiceProtocol  {

    private let cache: ImageCacheProtocol = ImageCache()

    func loadImage(from url: URL) -> AnyPublisher<UIImage?, Never> {
        if let image = cache.get(for: url) {
            return .just(image)
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, response) -> UIImage? in return UIImage(data: data) }
            .catch { error in return Just(nil) }
            .handleEvents(receiveOutput: {[unowned self] image in
                guard let image = image else { return }
                self.cache.insert(image, for: url)
            })
            .print("Image loading \(url):")
            .eraseToAnyPublisher()
    }
    
    func getCachedImage(url: URL) -> UIImage? {
        return cache.get(for: url)
    }
}
