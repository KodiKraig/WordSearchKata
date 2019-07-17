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
    
    private enum Direction {
        case vertical, horizontal, diagonal
    }

    private let grid: [[Character]]
    
    public init(grid: [[Character]]) {
        self.grid = grid
    }
    
    public func solve(forWord word: String) -> [XYCoordinate] {
        var coords = [XYCoordinate]()
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                
                // Look forward horizontal
                if solve(startIndex: j, endIndex: grid.count - 1, step: 1, baseIndex: i, word: word, direction: .horizontal, coords: &coords) {
                    return coords
                }

                // Look backward horizontal
                if solve(startIndex: j, endIndex: 0, step: -1, baseIndex: i, word: word, direction: .horizontal, coords: &coords) {
                    return coords
                }
                
                // Look forward vertical
                if solve(startIndex: i, endIndex: grid.count - 1, step: 1, baseIndex: j, word: word, direction: .vertical, coords: &coords) {
                    return coords
                }
                
                // Look backward vertical
                if solve(startIndex: i, endIndex: 0, step: -1, baseIndex: j, word: word, direction: .vertical, coords: &coords) {
                    return coords
                }
                
                // Look forward diagonal
                if solve(startIndex: i, endIndex: grid.count - 1, step: 1, baseIndex: j, word: word, direction: .diagonal, coords: &coords) {
                    return coords
                }
            }
        }
        return coords
    }
    
    private func solve(startIndex: Int, endIndex: Int, step: Int, baseIndex: Int, word: String, direction: Direction, coords: inout [XYCoordinate]) -> Bool {
        var runningIndex = 0
        for i in stride(from: startIndex, through: endIndex, by: step) {
            
            let char = word[runningIndex]
            
            if (direction == .vertical && grid[i][baseIndex] == char) || (direction == .horizontal && grid[baseIndex][i] == char) || (direction == .diagonal && grid[i][baseIndex + runningIndex] == char) {
                
                // Character matching
                switch direction {
                case .vertical: coords.append(XYCoordinate(x: baseIndex, y: i))
                case .horizontal: coords.append(XYCoordinate(x: i, y: baseIndex))
                case .diagonal: coords.append(XYCoordinate(x: i, y: baseIndex + runningIndex))
                }
                
                if runningIndex == word.count - 1 {
                    // Success!
                    return true
                }
                runningIndex+=1
            } else {
                break
            }
        }
        coords.removeAll()
        return false
    }
}

private extension StringProtocol {
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
}
