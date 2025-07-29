//
//  MovieDetailsNetwork.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//
import Foundation

struct MovieDetailsNetwork {
    private init() {}
}

extension MovieDetailsNetwork {
    
    static func movieDetailsApi(movieId: Int) -> Endpoint<MovieDetailsModel> {
        return .init(method: .get, path: "3/movie/\(movieId)", headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
}
