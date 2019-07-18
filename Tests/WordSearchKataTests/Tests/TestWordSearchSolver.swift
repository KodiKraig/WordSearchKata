//
//  TestWordSearchSolver.swift
//  WordSearchKata
//
//  Created by Cody Craig on 7/17/19.
//

import XCTest
import WordSearchKataCore

class TestWordSearchSolver: XCTestCase {

    // MARK: solve - filePath

    func testSolveWordSearch_BuildError() {
        XCTAssertEqual(WordSearchSolver.solve(filePath: "notAFile.txt"), "notAFile.txt does not exist")
    }

    func testSolveWordSearch() {
        let ref = [
            "JOB: (0,0),(1,0),(2,0)\n",
            "JIM: (0,0),(1,1),(2,2)\n",
            "BIZ: (0,1),(1,1),(2,1)\n",
            "MAN: (2,2),(1,2),(0,2)\n"
        ]
        XCTAssertEqual(WordSearchSolver.solve(filePath: TestDataFiles.smallSingleWorld.path), ref.joined(separator: ""))
    }

    // MARK: solve - forWord
    
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

    func testSolve_ForwardDiagonalForwardFacingWord() {
        let grid: [[Character]] = [
            ["J", "A", "B"],
            ["F", "I", "C"],
            ["H", "E", "M"]
        ]

        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")

        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 0)
        XCTAssertEqual(locations[0].y, 0)

        XCTAssertEqual(locations[1].x, 1)
        XCTAssertEqual(locations[1].y, 1)

        XCTAssertEqual(locations[2].x, 2)
        XCTAssertEqual(locations[2].y, 2)
    }

    func testSolve_ForwardDiagonalBackwardFacingWord() {
        let grid: [[Character]] = [
            ["M", "A", "B"],
            ["F", "I", "C"],
            ["H", "E", "J"]
        ]

        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")

        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 2)
        XCTAssertEqual(locations[0].y, 2)

        XCTAssertEqual(locations[1].x, 1)
        XCTAssertEqual(locations[1].y, 1)

        XCTAssertEqual(locations[2].x, 0)
        XCTAssertEqual(locations[2].y, 0)
    }

    func testSolve_BackwardDiagonalForwardFacingWord() {
        let grid: [[Character]] = [
            ["T", "A", "J"],
            ["F", "I", "C"],
            ["M", "E", "R"]
        ]

        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")

        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 2)
        XCTAssertEqual(locations[0].y, 0)

        XCTAssertEqual(locations[1].x, 1)
        XCTAssertEqual(locations[1].y, 1)

        XCTAssertEqual(locations[2].x, 0)
        XCTAssertEqual(locations[2].y, 2)
    }

    func testSolve_BackwardDiagonalBackwardFacingWord() {
        let grid: [[Character]] = [
            ["T", "A", "M"],
            ["F", "I", "C"],
            ["J", "E", "R"]

        ]

        let locations = WordSearchSolver(grid: grid).solve(forWord: "JIM")

        XCTAssertEqual(locations.count, 3)
        XCTAssertEqual(locations[0].x, 0)
        XCTAssertEqual(locations[0].y, 2)

        XCTAssertEqual(locations[1].x, 1)
        XCTAssertEqual(locations[1].y, 1)

        XCTAssertEqual(locations[2].x, 2)
        XCTAssertEqual(locations[2].y, 0)
    }
}
