//
//  NetworkReachability.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Alamofire

struct NetworkReachability {
    static let shared = NetworkReachability()
    
    private let reachabilityManager = NetworkReachabilityManager()
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
}
