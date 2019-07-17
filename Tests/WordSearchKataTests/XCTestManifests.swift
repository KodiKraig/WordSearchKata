import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    fatalError("Must run on Mac with ObjectiveC runtime")
    return [
        testCase(testTests.allTests),
    ]
}
#endif
