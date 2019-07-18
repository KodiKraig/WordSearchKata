import Foundation

public final class App {
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
