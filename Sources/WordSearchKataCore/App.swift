import Foundation

public typealias Result<T> = (result: T?, error: String?)

public final class App {
    
    /// Given a properly formatted word search file path, parse the word search and return the formatted word location string.
    ///
    /// - Parameter filePath: File path leading to word search txt file
    /// - Returns: Formatted word location(s)
    public class func solveWordSearch(filePath: String) -> String {
        let result = WordSearchModel.build(fromFileAtPath: filePath)
        guard
            let model = result.result,
            result.error == nil
            else { return result.error ?? "Unable to construct word search" }

        var output = ""
        let solver = WordSearchSolver(grid: model.grid)

        for word in model.searchWords {
            output+="\(word): \(solver.solve(forWord: word).compactMap({ $0.prettyPrint }).joined(separator: ","))\n"
        }
        return output
    }
}
