import Foundation

func main() {
    
    let file = AppFile(fileName: "day14.txt")
    let content = file.readDocument()
    let instructions = content.components(separatedBy: .newlines)
    // print(instructions)
    // print(binAndPad(num: 0))
    var memoryDict: [Int: Int] = [:]
    var currMask: String = ""
    for line in instructions {
        maskOrMem(line:line, memoryDict: &memoryDict, currMask: &currMask)
        // print(currMask)
    }
    var total = 0
    for (key, val) in memoryDict {
        total += val
    }
    print(total)
}

func maskOrMem(line: String, memoryDict: inout [Int:Int], currMask: inout String)
{
    let lineArr = line.components(separatedBy: " ")
    if line.contains("mask") {
        
        currMask = lineArr[2]
    }
    else {
        let value = Int(lineArr[2])
        let holder2 = line.components(separatedBy: "]")
        let holder3 = holder2[0].components(separatedBy: "[")
        let memoryAddress = Int(holder3[1])
        // okay i threw up in my mouth a bit
        // print(memoryAddress)
        let maskedValue = maskIt(value: value!, mask: &currMask)
        // print(maskedValue)
        memoryDict[memoryAddress!] = Int(maskedValue, radix: 2)
        //  = maskedValue
    }
    
}

func maskIt(value: Int, mask: inout String) -> String
{
    let binnedVal = binAndPad(num: value)
    if binnedVal.count != mask.count {
        print("uh poh")
    }
    var newValue: [String] = []
    for (index, _) in binnedVal.enumerated() {
        if mask[index] == "X" {
            newValue.append(binnedVal[index])
        }
        else {
            newValue.append(mask[index])
        }
    }
    return newValue.joined()
}

// func applyMaske()

func binAndPad(num: Int) -> String
{
    var padded = String(num, radix: 2)
    for _ in 0..<(36 - padded.count) {
        padded = "0" + padded
    }
    return padded
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}