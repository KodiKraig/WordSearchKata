import Foundation

public typealias Result<T> = (result: T?, error: String?)

public struct WordSearchModel {

    static let wordSearchDirectoryName = "WordSearches"

    public let searchWords: [String]
    public let grid: [[Character]]

    public static func build(fromFileAtPath filePath: String) -> Result<WordSearchModel> {
        // Ensure the file exists
        if !FileManager.default.fileExists(atPath: filePath) {
            return (nil, "\(filePath) does not exist")
        }

        var searchWords: [String]?
        var grid: [[Character]]?
        
        do {
            let data = try String(contentsOfFile: filePath, encoding: .utf8)
            var myStrings = data.components(separatedBy: .newlines)

            // Parse the search words
            searchWords = myStrings.remove(at: 0).components(separatedBy: ",").filter({ !$0.isEmpty })

            // Parse the word search grid
            grid = [[Character]]()
            for line in myStrings {
                guard !line.isEmpty else { continue }
                let newChars = line.components(separatedBy: ",").compactMap({ $0[$0.startIndex] })
                grid!.append(newChars)
            }
        } catch {
            return (nil, "Unable to parse grid: \(error.localizedDescription)")
        }

        guard searchWords != nil, grid != nil else { return (nil, nil) }
        return (WordSearchModel(searchWords: searchWords!, grid: grid!), nil)
    }
}
