//
//  Reachability.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation
import Alamofire

class Reachability {
    private let manger = NetworkReachabilityManager(host: "www.apple.com")
    private(set) var lastStatus: NetworkReachabilityManager.NetworkReachabilityStatus?
    private var currentStatus: NetworkReachabilityManager.NetworkReachabilityStatus? {
        willSet {
            self.lastStatus = currentStatus
        }
    }
    func listen(onQueue: DispatchQueue = .main, onUpdatePerforming listener: @escaping NetworkReachabilityManager.Listener) {
        manger?.startListening(onQueue: onQueue){ [weak self] status in
            self?.currentStatus = status
            listener(status)
        }
    }
}
