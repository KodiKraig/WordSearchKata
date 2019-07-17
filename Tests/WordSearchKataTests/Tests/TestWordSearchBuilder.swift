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
    
    // MARK: build

    func testBuild_NameDoesNotExist() {
        XCTAssertEqual(WordSearchModel.build(fromFileAtPath: "notAWordSearchPuzzle.txt").error, "notAWordSearchPuzzle.txt does not exist")
    }

    func testBuild_EmptyWordSearch() {
        let builderResult = WordSearchModel.build(fromFileAtPath: TestDataFiles.empty.path)
        XCTAssertNil(builderResult.error)
        
        let model = builderResult.result!
        XCTAssertEqual(model.searchWords.count, 0)
        XCTAssertEqual(model.grid.count, 0)
    }

    func testBuild_SmallWordSearch() {
        let builderResult = WordSearchModel.build(fromFileAtPath: TestDataFiles.smallSingleWorld.path)
        XCTAssertNil(builderResult.error)
        
        let model = builderResult.result!
        XCTAssertEqual(model.searchWords.count, 4)
        XCTAssertEqual(model.grid.count, 3)
    }
}
