//
//  BaseResponse.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//


import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    var key: ServerResponseKey
    var message: String
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case key
        case message = "msg"
        case data
    }
    
}
