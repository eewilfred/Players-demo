//
//  Scheduler.swift
//  player-demo
//
//  Created by edwin wilson on 20/07/2023.
//

import Foundation
import Combine

fileprivate let maxConcurrentOperationCount = 8 //usefull for image loading

final class Scheduler {

    static var backgroundTaskScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = maxConcurrentOperationCount
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()

    static let mainTaskScheduler = RunLoop.main
}
