//
//  UpcomingNetwork.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation

struct UpcomingNetwork {
    private init() {}
}

extension UpcomingNetwork {
    
    static func upcomingMoviesApi(page: Int) -> Endpoint<UpcomingMoviesModel> {
        return .init(method: .get, path: "3/movie/upcoming", queries: ["page": page] , headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
    
    
}
