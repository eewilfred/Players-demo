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
}
