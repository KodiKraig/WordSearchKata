//
//  TestXYCoordinate.swift
//  WordSearchKata
//
//  Created by Cody Craig on 7/17/19.
//

import XCTest
import WordSearchKataCore

class TestXYCoordinate: XCTestCase {
    func testPrettyPrint() {
        XCTAssertEqual(XYCoordinate(x: 5, y: 6).prettyPrint, "(5,6)")
    }
}
