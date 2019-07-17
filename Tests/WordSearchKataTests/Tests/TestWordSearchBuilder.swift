//
//  TestWordSearchBuilder.swift
//  WordSearchKataTest
//
//  Created by Cody Craig on 7/17/19.
//  Copyright © 2019 Cody Craig. All rights reserved.
//

import XCTest
import WordSearchKataCore

class TestWordSearchBuilder: XCTestCase {

    func testFileNameDoesNotExist() {
        XCTAssertEqual(WordSearchBuilder.build(fromFileNamed: "notAWordSearchPuzzle.txt").error, "File notAWordSearchPuzzle.txt does not exist")
    }

    func testEmptyWordSearch() {
        let builderResult = WordSearchBuilder.build(fromFileNamed: TestDataFiles.empty.path)
        XCTAssertNil(builderResult.error)
        XCTAssertEqual(builderResult.result!.count, 0)
    }
}
