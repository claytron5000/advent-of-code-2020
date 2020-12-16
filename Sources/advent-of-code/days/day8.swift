import Foundation

func main() {
    

    print("Enter filename:")
    

    if let fileName = readLine() 
    {
        let file = AppFile(fileName: fileName)
        let content = file.readDocument()
        let instructions = content.components(separatedBy: .newlines)

        var accumulator = 0
        var visited: Set<Int> = []
        func execute(index: Int ) -> Int
        {
            if index >= instructions.count {
                print("uh oh")
                print(index)
                return accumulator
            }
            let thing = instructions[index].components(separatedBy: " ")
            let instruct = thing[0]
            let startIndex = thing[1].index(thing[1].startIndex, offsetBy: 1)
            let value = Int(thing[1][startIndex...])!
            let sign = thing[1][..<startIndex]
            if visited.contains(index) {
                print("loop")
                return accumulator
            }
            else {
                visited.insert(index)
                switch instruct {
                case "acc":
                    accumulator = sign == "+" ? accumulator + value : accumulator - value
                    return execute(index: index + 1)
                case "jmp":
                    print("value", value)
                    print("sign", sign)
                    print("index ", index)
                    let nextIndex = sign == "+" ? index + value : index - value
                    print("nextIndex", nextIndex)
                    print("next value", instructions[nextIndex])
                    if nextIndex >= instructions.count {
                        print("wtf")
                        return execute(index: nextIndex)
                    }
                    return execute(index: nextIndex)
                default: //nop
                    return execute(index: index+1)
                }
            }
        }
        
        let acc = execute(index: 0)
        print(acc)
    }

    

    

}

