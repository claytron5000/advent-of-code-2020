import Foundation

func main() {
    
    let str = "abcde"
    if let index = str.index(of: "cd") {
        let substring = str[..<index]   // ab
        let string = String(substring)
        print(string)  // "ab\n"
    }

    // let query = "cd"
    // let escapedQuery = NSRegularExpression.escapedPattern(for: query)
    // let ranges = str.ranges(of: escapedQuery, options: .regularExpression)
    
    let str2 = "abcdefg"
    let match = str2.regex(of: "be")
    print(match)

}

