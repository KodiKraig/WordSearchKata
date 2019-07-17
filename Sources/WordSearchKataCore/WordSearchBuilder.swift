import Foundation

public typealias Result<T> = (result: T?, error: String?)

public class WordSearchBuilder {
    public class func build(fromFileNamed fileName: String) -> Result<[[Character]]> {
        if !FileManager.default.fileExists(atPath: fileName) {
            return (nil, "File \(fileName) does not exist")
        }
        var model = [[Character]]()

        return (model, nil)
    }
}
