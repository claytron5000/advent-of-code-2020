import Foundation

class Utilities {
	static func readFile(inputPath: String) {
		do {
			let data = try String(contentsOf: URL(fileURLWithPath: inputPath))
			let myStrings = data.components(separatedBy: .newlines)
			print(type(of: myStrings))
		}
		catch {
			print("nah")
		}
	}
}

func lineToStruct(line: String) {

	let arr = line.components(separatedBy:": ")
	print(arr)
//	print(val)

}

//func ~=(pattern: String, value: ParsedThing) -> Bool {
//	let target = value.key.target
//	let max = value.key.max
//	let min = value.key.min
//	let password = value.password
//
//	let num = countInstanceOfTarget(targ, password)
//	if( min <= num <= max) {
//		// do the thing
//	}
//}
Utilities.readFile(inputPath: "./input.txt")


lineToStruct(line: "10-12 g: gjgggggggkhgggg")