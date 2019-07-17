//
//  XYCoordinate.swift
//  WordSearchKata
//
//  Created by Cody Craig on 7/17/19.
//

import Foundation

public struct XYCoordinate {
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public var prettyPrint: String {
        return "(\(x),\(y))"
    }
}
