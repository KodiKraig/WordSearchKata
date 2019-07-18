# WordSearchKata

Word search solver [Kata exercise](https://github.com/PillarTechnology/kata-word-search) written in [Swift](https://swift.org) using [Swift Package Manager](https://github.com/apple/swift-package-manager).

## Running

### Requirements
- Swift >= 5.0.1

#### Default Word Search
- Run the word search solver on the default word search file with the following command

`swift run`

#### Custom Word Search
- If you would like to add your own word search, add the file to the WordSearches directory in root and run the following command

`swift run WordSearchKata <FileName>`

## Testing

To run the tests make sure you are in the root directory

`swift test`

- Note: While Swift is cross-platform, testing with XCTest behaves differently when running on linux since there is no ObjectiveC runtime. Therefore, tests can only be run where the ObjectiveC runtime is present. For more information please visit [XCTest on Linux](https://oleb.net/blog/2017/03/keeping-xctest-in-sync/).
