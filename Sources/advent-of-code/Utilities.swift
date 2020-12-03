import Foundation

class Utilities {
    static func readFile(inputPath: String) {
        do {
            let textFile = try String(contentsOf: URL(fileURLWithPath: inputPath))
            print(textFile)
        }
        catch {
            print("nah")
        }
    }


}


