import Foundation 

let file = "input3.txt"

// This requires the file to be in the Documents directory
if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

    let fileURL = dir.appendingPathComponent(file)

    do {
        let text = try String(contentsOf: fileURL, encoding: .utf8)
        let lines = text.split(whereSeparator: \.isNewline)
        let lineLength = countChars(string: lines[0])
        var grid: Array<Array<Character>> = []
        for line in lines {
            grid.append(stringToArray(string: line))
        }    
        var treeCount: Int = 0
        print("Enter run:")
        if let slope = readLine() {
            if let num = Int(slope) {
                print("Enter rise:")
                if let rise = readLine() {
                    if let num2 = Int(rise) {
                        for index in 0...grid.count-1 {
                            if index % num2 != 0 {
                                continue
                            }
                            let position = index * Int(num)
                            let rowIndex = position % lineLength
                            if grid[index][rowIndex] == "#" {
                                treeCount = treeCount + 1
                            }
                        }
                        print(treeCount)
                    }
                }

            }
        } else {
            print("Why are you being so coy?")
        }


    }
    catch {
        print("error: ", error)
    }
} 
else {
    print("no luck with the directory")
}

func stringToArray(string: Substring) -> Array<Character> {
    var array: Array<Character> = []
    for char in string {
        array.append(Character(extendedGraphemeClusterLiteral:char))
    }
    return array
}

func countChars(string: Substring) -> Int {
    var count: Int = 0
    for _ in string {
        count = count+1
    }
    return count
}
