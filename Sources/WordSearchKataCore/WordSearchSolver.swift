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
                
                // Look forward horizontal
                var forwardIndex = 0
                for k in j..<grid.count {
                    if grid[i][k] == word[forwardIndex] {
                        // Character match
                        coords.append(XYCoordinate(x: k, y: i))

                        if forwardIndex == word.count - 1 {
                            // Success!
                            return coords
                        }
                        forwardIndex+=1
                    } else {
                        break
                    }
                }
                coords.removeAll()

                // Look backward horizontal
                var backwardIndex = 0
                for k in stride(from: j, through: 0, by: -1) {
                    if grid[i][k] == word[backwardIndex] {
                        // Character match
                        coords.append(XYCoordinate(x: k, y: i))
                        
                        if backwardIndex == word.count - 1 {
                            // Success!
                            return coords
                        }
                        backwardIndex+=1
                    } else {
                        break
                    }
                }
                coords.removeAll()
                
                // Look forward vertical
                forwardIndex = 0
                for k in i..<grid.count {
                    if grid[k][j] == word[forwardIndex] {
                        // Character match
                        coords.append(XYCoordinate(x: j, y: k))
                        
                        if forwardIndex == word.count - 1 {
                            // Success!
                            return coords
                        }
                        forwardIndex+=1
                    } else {
                        break
                    }
                }
                coords.removeAll()
                
                // Look backward vertical
                backwardIndex = 0
                for k in stride(from: i, through: 0, by: -1) {
                    if grid[k][j] == word[backwardIndex] {
                        // Character match
                        coords.append(XYCoordinate(x: j, y: k))
                        
                        if backwardIndex == word.count - 1 {
                            // Success!
                            return coords
                        }
                        backwardIndex+=1
                    } else {
                        break
                    }
                }
                coords.removeAll()
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
