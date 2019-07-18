import Foundation
import WordSearchKataCore

fileprivate let defaultWordSearch = "DefaultWordSearch.txt"
fileprivate let wordSearchDirectory = "WordSearches"

func main() {
    let arguments = ProcessInfo.processInfo.arguments
    let wordSearchFileName = arguments.count > 1 ? arguments[1] : defaultWordSearch
    print(App.solveWordSearch(filePath: "\(FileManager.default.currentDirectoryPath)/\(wordSearchDirectory)/\(wordSearchFileName)"))
}

main()
