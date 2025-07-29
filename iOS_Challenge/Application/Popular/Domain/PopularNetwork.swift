//
//  PopularNetwork.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation

struct PopularNetwork {
    private init() {}
}

extension PopularNetwork {
    
    static func popularMoviesApi(page: Int) -> Endpoint<PopularMoviesModel> {
        return .init(method: .get, path: "3/movie/popular", queries: ["page": page] , headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
    
}
