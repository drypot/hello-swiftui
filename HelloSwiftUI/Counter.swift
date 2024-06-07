//
//  Counter.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 6/6/24.
//

import Foundation

struct Counter {
    var counter = 0
    
    mutating func increment() -> Int {
        var previous = counter
        counter += 1
        return previous
    }
}
