import Foundation

public typealias Result<T> = (result: T?, error: String?)

public struct WordSearchModel {
    
    /// Word search words to find within the grid
    public let searchWords: [String]
    
    /// Word search representation
    public let grid: [[Character]]
    
    /// Build a model from the given file path
    ///
    /// - Parameter filePath: location of word search file
    /// - Returns: model representing the word search at the given file path
    public static func build(fromFileAtPath filePath: String) -> Result<WordSearchModel> {
        // Ensure the file exists
        if !FileManager.default.fileExists(atPath: filePath) {
            return (nil, "\(filePath) does not exist")
        }

        var searchWords: [String]!
        var grid: [[Character]]!

        do {
            let data = try String(contentsOfFile: filePath, encoding: .utf8)

            // Parse the search words
            var myStrings = data.components(separatedBy: .newlines)
            searchWords = myStrings.remove(at: 0).components(separatedBy: ",").filter({ !$0.isEmpty })

            // Parse the word search grid
            grid = [[Character]]()
            for line in myStrings {
                guard !line.isEmpty else { continue }
                let newChars = line.components(separatedBy: ",").compactMap({ $0[$0.startIndex] })
                grid.append(newChars)
            }
        } catch {
            return (nil, "Unable to parse grid: \(error.localizedDescription)")
        }
        return (WordSearchModel(searchWords: searchWords!, grid: grid!), nil)
    }
}
