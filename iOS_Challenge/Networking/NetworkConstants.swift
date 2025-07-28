//
//  NetworkConstants.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation

struct NetworkConstants {
    private init() {}
    static let domain = "https://api.themoviedb.org"
    static var server: String {
        return domain + ""
    }
}
