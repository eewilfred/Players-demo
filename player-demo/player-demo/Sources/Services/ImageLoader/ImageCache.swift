//
//  ImageCache.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import UIKit

// in memeory cache
protocol ImageCacheProtocol: AnyObject {
    
    ///get image associated with url
    func get(for url: URL) -> UIImage?
    
    ///Inserts the image of the specified url in the cache
    func insert(_ image: UIImage?, for url: URL)
    
    /// remove one image for given url
    func remove(for url: URL)
    
    /// clear cache
    func clearCache()
    
   /// Syntax suger to make accessing easy
    subscript(_ url: URL) -> UIImage? { get set }
}

final class ImageCache: ImageCacheProtocol {

    private lazy var cache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = config.countLimit
        return cache
    }()

    private lazy var decodedCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.totalCostLimit = config.memoryLimit
        return cache
    }()
    
    private let lock = NSLock()
    private let config: Config

    struct Config {
        let countLimit: Int
        let memoryLimit: Int

        static let defaultConfig = Config(countLimit: 100, memoryLimit: 1024 * 1024 * 50) // MAX 50 mb
    }

    init(config: Config = Config.defaultConfig) {
        self.config = config
    }

    func get(for url: URL) -> UIImage? {
        lock.lock(); defer { lock.unlock() }
        // the best case -> there is a decoded image in memory
        if let decodedImage = decodedCache.object(forKey: url as AnyObject) as? UIImage {
            return decodedImage
        }

        if let image = cache.object(forKey: url as AnyObject) as? UIImage {
            let decodedImage = image.decodedImage()
            decodedCache.setObject(image as AnyObject, forKey: url as AnyObject, cost: decodedImage.diskSize)
            return decodedImage
        }
        return nil
    }

    func insert(_ image: UIImage?, for url: URL) {
        guard let image = image else { return remove(for: url) }
        let decompressedImage = image.decodedImage()

        lock.lock(); defer { lock.unlock() }
        cache.setObject(decompressedImage, forKey: url as AnyObject, cost: 1)
        decodedCache.setObject(image as AnyObject, forKey: url as AnyObject, cost: decompressedImage.diskSize)
    }

    func remove(for url: URL) {
        lock.lock(); defer { lock.unlock() }
        cache.removeObject(forKey: url as AnyObject)
        decodedCache.removeObject(forKey: url as AnyObject)
    }

    func clearCache() {
        lock.lock(); defer { lock.unlock() }
        cache.removeAllObjects()
        decodedCache.removeAllObjects()
    }

    subscript(_ key: URL) -> UIImage? {
        get {
            return get(for: key)
        }
        set {
            return insert(newValue, for: key)
        }
    }
}

fileprivate extension UIImage {

    func decodedImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        self.draw(at: CGPoint.zero)
        UIGraphicsEndImageContext()
        return self
    }

    // Rough estimation of how much memory image uses in bytes
    var diskSize: Int {
        guard let cgImage = cgImage else { return 0 }
        return cgImage.bytesPerRow * cgImage.height
    }
}
