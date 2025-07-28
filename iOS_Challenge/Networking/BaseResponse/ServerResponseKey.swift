//
//  ServerResponseKey.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//


import Foundation

enum ServerResponseKey: String, Decodable {
    case success
    case fail
    case unauthenticated = "unauthorized"
    case needActive
    case exception
    case blocked
}
