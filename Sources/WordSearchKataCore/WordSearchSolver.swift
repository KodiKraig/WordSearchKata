//
//  WordSearchSolver.swift
//  WordSearchKata
//
//  Created by Cody Craig on 7/17/19.
//

import Foundation

public struct XYCoordinate {
    public let x: Int
    public let y: Int
    
    public var prettyPrint: String {
        return "(\(x),\(y))"
    }
}

public class WordSearchSolver {
    private let grid: [[Character]]
    
    public init(grid: [[Character]]) {
        self.grid = grid
    }
    
    public func solve(forWord word: String) -> [XYCoordinate] {
        var coords = [XYCoordinate]()
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                
                // Look forward
                var forwardIndex = 0
                for k in i..<grid.count {
                    if grid[k][j] == word[forwardIndex] {
                        // Character match
                        coords.append(XYCoordinate(x: k, y: j))

                        if forwardIndex == word.count - 1 {
                            // Success!
                            return coords
                        }
                        forwardIndex+=1
                    } else {
                        // Fail
                        coords.removeAll()
                        break
                    }
                }
            }
        }
        return coords
    }
}

private extension StringProtocol {
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
}
