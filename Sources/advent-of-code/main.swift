import Foundation
func main() {

    let fm = FileManager.default

    print("Enter the day number you'd like to run.")

    if let dayNum = readLine()
    {
        if Int(dayNum) != nil {
            let pathString = "/Users/clayton/Projects/advent-of-code-2020/Sources/advent-of-code/days"
            let url = URL(string: pathString)!
            do {
                let files = try fm.contentsOfDirectory(at: url, includingPropertiesForKeys: [])
                let swiftFiles = files.filter {$0.pathExtension == "swift"}

                for file in swiftFiles {
                    let path = file.pathComponents
                    let fileName = path[path.count-1]
                    let dotIndex = fileName.index(of: ".")!
                    let num = fileName[..<dotIndex]
                    // print(num.dropFirst(3))
                    if Int(dayNum) == Int(num.dropFirst(3)){
                        chooseFunc(num: Int(dayNum)!)
                        break
                    }
                }
                // print("No file to run, create one called day\(dayNum).swift in the days directory.")

            }
            catch {
                print("wrong")
            }
        }
    }
}

func chooseFunc(num: Int) {
    print("run day\(num)")
}
extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
}
main()