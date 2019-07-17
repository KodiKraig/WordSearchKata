//
//  TestWordSearchSolver.swift
//  WordSearchKata
//
//  Created by Cody Craig on 7/17/19.
//

import XCTest
import WordSearchKataCore

class TestWordSearchSolver: XCTestCase {
    
    func testSolve_ForwardFacingWord() {
        let grid: [[Character]] = [["J"], ["I"], ["M"]]
        
        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")
        
        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 0)
        XCTAssertEqual(locations[0].y, 0)
        
        XCTAssertEqual(locations[1].x, 1)
        XCTAssertEqual(locations[1].y, 0)
        
        XCTAssertEqual(locations[2].x, 2)
        XCTAssertEqual(locations[2].y, 0)
    }
}
