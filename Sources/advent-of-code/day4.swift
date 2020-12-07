import Foundation

func main() {
    let file = AppFile(fileName: "input4.txt")
    let content = file.readDocument();

    let lines = content.components(separatedBy: .newlines)
    
    var maker: PassportFactory = PassportFactory()

    for line in lines {
        maker.processLine(line: line)
    }

}

struct Passport {
    var byr: Int?
    var iyr: Int?
    var eyr: Int?
    var hgt: String?
    var hcl: String?
    var ecl: String?
    var pid: String?
    var cid: String?

    init(dict: [String : String]) 
    {
        for (key, val) in dict {
            switch key {
            case "byr":
                let intVal = Int(val) ?? 0
                if (1920 <= intVal && intVal <= 2002 ) {
                    byr = intVal
                }
            case "iyr":
                let intVal = Int(val) ?? 0
                if (2010 <= intVal && intVal <= 2020 ) {
                    iyr = intVal
                }
            case "eyr":
                let intVal = Int(val) ?? 0
                if (2020 <= intVal && intVal <= 2030 ) {
                    eyr = intVal
                }
            case "hgt":
                hgt = val
            case "hcl":
                let substring = val[1..<val.count]
                let first = val[0]
                if String(substring).isHexNumber() && substring.count == 6 && first == "#" {
                    hcl = val
                }

            case "ecl":
                ecl = val
            case "pid":
                pid = val
            case "cid":
                cid = val
            default:
                print(key, " not assigned")
            }
        }
    }

    func checkFields()-> Bool 
    {
         
        byr != nil &&
        iyr != nil &&
        eyr != nil &&
        hgt != nil &&
        hcl != nil &&
        ecl != nil &&
        pid != nil 
        
    }

    
}

struct PassportFactory {

    var fieldDictionary: [String: String] = [:]
    var validCount: Int = 0

    mutating func processLine(line: String) 
    {

        if line.isEmpty {

            let passport = Passport(dict: fieldDictionary)
            if passport.checkFields() {
                validCount = validCount + 1
                print(validCount)
            }
            // reset for the next passport
            fieldDictionary = [:]
        }
        else {
            print(line)
            extractFields(line: line)
        }

    }

    // private func checkFields() -> Bool 
    // {
    //     for (key, val) in fieldDictionary {
    //         switch key {
    //         case "byr":
    //             byr = val
    //         case "iyr":
    //             iyr = val
    //         case "eyr":
    //             eyr = val
    //         case "hgt":
    //             hgt = val
    //         case "hcl":
    //             hcl = val
    //         case "ecl":
    //             ecl = val
    //         case "pid":
    //             pid = val
    //         case "cid":
    //             cid = val
    //         default:
    //             print(key, " not assigned")
    //         }
    //     }
    // }

    private mutating func extractFields(line: String) 
    {

        let fields = line.components(separatedBy: " ")
        for field in fields {
            let keyVal = field.components(separatedBy: ":")
            fieldDictionary[keyVal[0]] = keyVal[1]
        }

    }

}


extension String {
    func isHexNumber() -> Bool {
        self.filter(\.isHexDigit).count == count
    }
}

public extension String {
  subscript(value: Int) -> Character {
    self[index(at: value)]
  }
}

public extension String {
  subscript(value: NSRange) -> Substring {
    self[value.lowerBound..<value.upperBound]
  }
}

public extension String {
  subscript(value: CountableClosedRange<Int>) -> Substring {
    self[index(at: value.lowerBound)...index(at: value.upperBound)]
  }

  subscript(value: CountableRange<Int>) -> Substring {
    self[index(at: value.lowerBound)..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeUpTo<Int>) -> Substring {
    self[..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeThrough<Int>) -> Substring {
    self[...index(at: value.upperBound)]
  }

  subscript(value: PartialRangeFrom<Int>) -> Substring {
    self[index(at: value.lowerBound)...]
  }
}

private extension String {
  func index(at offset: Int) -> String.Index {
    index(startIndex, offsetBy: offset)
  }
}