//
//  NetworkExecuter.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation

protocol NetworkExecuter {
    func execute(_ request: any Requestable, progress progressHandler: ((_ progress: Int)-> Void)?) async throws -> Data
}


