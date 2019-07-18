import Foundation
import WordSearchKataCore

func main() {
    let arguments = ProcessInfo.processInfo.arguments
    let wordSearchFileName = arguments.count > 1 ? arguments[1] : "DefaultWordSearch.txt"
    print(App.solveWordSearch(filePath: "\(FileManager.default.currentDirectoryPath)/WordSearches/\(wordSearchFileName)"))
}

main()
