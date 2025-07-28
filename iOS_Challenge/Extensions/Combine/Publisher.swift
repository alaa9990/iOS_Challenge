//
//  Publisher.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import Foundation
import Combine

extension Publisher where Self.Failure == Never {
    
    public func sinkOnMain(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable {
        self
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: receiveValue)
    }
    
}
