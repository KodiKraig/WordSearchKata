import Foundation
import WordSearchKataCore

func main() {
    let wordSearchFileName = CommandLine.arguments.count > 2 ? CommandLine.arguments[2] : "DefaultWordSearch.txt"
    print(App.solveWordSearch(filePath: "\(FileManager.default.currentDirectoryPath)/WordSearches/\(wordSearchFileName)"))
}

main()
