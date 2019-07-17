//
//  TestWordSearchSolver.swift
//  WordSearchKata
//
//  Created by Cody Craig on 7/17/19.
//

import XCTest
import WordSearchKataCore

class TestWordSearchSolver: XCTestCase {
    
    func testSolve_HorizontalForwardFacingWord() {
        let grid: [[Character]] = [
            ["J", "I", "M"],
            ["A", "B", "C"],
            ["D", "E", "F"]
        ]

        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")
        
        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 0)
        XCTAssertEqual(locations[0].y, 0)
        
        XCTAssertEqual(locations[1].x, 1)
        XCTAssertEqual(locations[1].y, 0)
        
        XCTAssertEqual(locations[2].x, 2)
        XCTAssertEqual(locations[2].y, 0)
    }
    
    func testSolve_HorizontalBackwardFacingWord() {
        let grid: [[Character]] = [
            ["M", "I", "J"],
            ["A", "B", "C"],
            ["D", "E", "F"]
        ]

        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")
        
        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 2)
        XCTAssertEqual(locations[0].y, 0)
        
        XCTAssertEqual(locations[1].x, 1)
        XCTAssertEqual(locations[1].y, 0)
        
        XCTAssertEqual(locations[2].x, 0)
        XCTAssertEqual(locations[2].y, 0)
    }
    
    func testSolve_VerticalForwardFacingWord() {
        let grid: [[Character]] = [
            ["J", "A", "B"],
            ["I", "B", "C"],
            ["M", "E", "F"]
        ]

        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")

        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 0)
        XCTAssertEqual(locations[0].y, 0)

        XCTAssertEqual(locations[1].x, 0)
        XCTAssertEqual(locations[1].y, 1)

        XCTAssertEqual(locations[2].x, 0)
        XCTAssertEqual(locations[2].y, 2)
    }
    
    func testSolve_VerticalBackwardFacingWord() {
        let grid: [[Character]] = [
            ["M", "A", "B"],
            ["I", "B", "C"],
            ["J", "E", "F"]
        ]
        
        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")
        
        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 0)
        XCTAssertEqual(locations[0].y, 2)
        
        XCTAssertEqual(locations[1].x, 0)
        XCTAssertEqual(locations[1].y, 1)
        
        XCTAssertEqual(locations[2].x, 0)
        XCTAssertEqual(locations[2].y, 0)
    }
}
