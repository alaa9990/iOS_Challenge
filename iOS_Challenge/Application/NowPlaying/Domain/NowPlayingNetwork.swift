//
//  NowPlayingNetwork.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation

struct NowPlayingNetwork {
    private init() {}
}

extension NowPlayingNetwork {
    
    static func nowPlayingMoviesApi(page: Int) -> Endpoint<NowPlayingModel> {
        return .init(method: .get, path: "3/movie/now_playing", queries: ["page": page] , headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
}
