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
    
    private enum Axis {
        case vertical, horizontal, diagonal
    }
    
    private enum Direction {
        case forward, backward
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
                if solve(word, row: i, column: j, direction: .forward, axis: .horizontal, coords: &coords) {
                    return coords
                }

                // Look backward horizontal
                if solve(word, row: i, column: j, direction: .backward, axis: .horizontal, coords: &coords) {
                    return coords
                }

                // Look forward vertical
                if solve(word, row: i, column: j, direction: .forward, axis: .vertical, coords: &coords) {
                    return coords
                }

                // Look backward vertical
                if solve(word, row: i, column: j, direction: .backward, axis: .vertical, coords: &coords) {
                    return coords
                }

                // Look forward diagonal
                if solve(word, row: i, column: j, direction: .forward, axis: .diagonal, coords: &coords) {
                    return coords
                }

                // Look backward diagonal
                if solve(word, row: i, column: j, direction: .backward, axis: .diagonal, coords: &coords) {
                    return coords
                }
            }
        }
        return coords
    }
    
    private func solve(_ word: String, row: Int, column: Int, wordIndex: Int = 0, direction: Direction, axis: Axis, coords: inout [XYCoordinate]) -> Bool {
        if row < 0 || row >= grid.count || column < 0 || column >= grid.count || wordIndex >= word.count || grid[row][column] != word[wordIndex] {
            coords.removeAll()
            return false
        }
        
        coords.append(XYCoordinate(x: column, y: row))
        
        if wordIndex == word.count - 1 {
            return true
        }
        
        var nextRowPosition = row
        var nextColumnPosition = column
        
        switch direction {
        case .forward:
            switch axis {
            case .horizontal:
                nextColumnPosition+=1
            case .vertical:
                nextRowPosition+=1
            case .diagonal:
                nextRowPosition+=1
                nextColumnPosition+=1
            }
        case .backward:
            switch axis {
            case .horizontal:
                nextColumnPosition-=1
            case .vertical:
                nextRowPosition-=1
            case .diagonal:
                nextRowPosition-=1
                nextColumnPosition-=1
            }
        }
        
        return solve(word, row: nextRowPosition, column: nextColumnPosition, wordIndex: wordIndex + 1, direction: direction, axis: axis, coords: &coords)
    }
}

private extension StringProtocol {
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
}
