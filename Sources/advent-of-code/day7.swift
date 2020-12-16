import Foundation

func main() {

    let file = AppFile(fileName: "day7.txt")
    let content = file.readDocument()
    let lines = content.components(separatedBy: .newlines)
    var tree = [String: Set<String>]()
    var lineCount = 0
    for line in lines {
        lineCount += 1
        let rule = makeRule(line: line)

        for child in rule.children {
            if tree[child] != nil {
                tree[child]!.insert(rule.parent)
            }
            else {
                tree[child] = [rule.parent]
            }
        }

    }
    print(tree.count)
    print(lineCount)
        
    func findLeaf(bag: String) -> Set<String>
    {
        if tree[bag] != nil {
            var children: Set<String> = [bag]
            for child in tree[bag]! {
                children = children.union( findLeaf(bag: child))
            }
            return children
        }
        else {
            return [bag]
        }
    }
    let leaves = findLeaf(bag: "shiny gold bag")
    print(leaves.count - 1)
}



func makeRule(line: String) -> Rule
{

    let firstSplit = line.components(separatedBy: "s contain ")
    
    let parent = firstSplit[0]
    let children: [String] = firstSplit[1].components(separatedBy: ", ").map { 
        let startIndex = $0.index($0.startIndex, offsetBy: 2)
        let endIndex = $0.endIndex(of: " bag")!
        
        return String($0[startIndex..<endIndex])
    }
    return Rule(parent: parent, children: Set(children))
}

struct Rule {
    var parent: String
    var children: Set<String>

}

// extension StringProtocol {
//     func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
//         range(of: string, options: options)?.lowerBound
//     }
//     func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
//         range(of: string, options: options)?.upperBound
//     }
//     func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
//         ranges(of: string, options: options).map(\.lowerBound)
//     }
//     func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
//         var result: [Range<Index>] = []
//         var startIndex = self.startIndex
//         while startIndex < endIndex,
//             let range = self[startIndex...]
//                 .range(of: string, options: options) {
//                 result.append(range)
//                 startIndex = range.lowerBound < range.upperBound ? range.upperBound :
//                     index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
//         }
//         return result
//     }
// }