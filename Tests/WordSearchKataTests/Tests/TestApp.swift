//
//  TestApp.swift
//  WordSearchKata
//
//  Created by Cody Craig on 7/17/19.
//

import XCTest
import WordSearchKataCore

class TestApp: XCTestCase {

    func testSolveWordSearch_BuildError() {
        XCTAssertEqual(App.solveWordSearch(filePath: "notAFile.txt"), "notAFile.txt does not exist")
    }
    
    func testSolveWordSearch() {
        let ref = [
            "JOB: (0,0),(1,0),(2,0)\n",
            "JIM: (0,0),(1,1),(2,2)\n",
            "BIZ: (0,1),(1,1),(2,1)\n",
            "MAN: (2,2),(1,2),(0,2)\n"
        ]
        XCTAssertEqual(App.solveWordSearch(filePath: TestDataFiles.smallSingleWorld.path), ref.joined(separator: ""))
    }
}
