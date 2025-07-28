//
//  RequestHeaderType.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation

enum RequestHeaderType {
    
    case authorized(token: String)
    case unauthorized
    
    var header: [String:String] {
        
        var commonHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "lang": "en"
        ]
        
        switch self {
        case .authorized(let token):
            commonHeaders["Authorization"] = "Bearer \(token)"
            return commonHeaders
        case .unauthorized:
            return commonHeaders
        }
        
    }
    
}
