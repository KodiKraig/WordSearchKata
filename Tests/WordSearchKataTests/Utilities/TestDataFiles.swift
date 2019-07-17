import Foundation

enum TestDataFiles: String {
    case empty = "EmptyFile.txt"
    case smallSingleWorld = "SmallSingleWordSearch.txt"

    var path: String {
        return "\(FileManager.default.currentDirectoryPath)/Tests/WordSearchKataTests/TestData/\(self.rawValue)"
    }
}
