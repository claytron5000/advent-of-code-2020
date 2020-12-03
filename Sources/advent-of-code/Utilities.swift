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

class Utilities {
	static func readFile(inputPath: String) {
		
		let path = FileManager.default.currentDirectoryPath
		do {
			// get the documents folder url
			if let documentDirectory = FileManager.default.urls(for: path, in: .userDomainMask).first {
				// create the destination url for the text file to be saved
				let fileURL = documentDirectory.appendingPathComponent("file.txt")
				// define the string/text to be saved
				let text = "Hello World !!!"
				// writing to disk 
				// Note: if you set atomically to true it will overwrite the file if it exists without a warning
				try text.write(to: fileURL, atomically: false, encoding: .utf8)
				print("saving was successful")
				// any posterior code goes here
				// reading from disk
				let savedText = try String(contentsOf: fileURL)
				print("savedText:", savedText)   // "Hello World !!!\n"
			}
		} catch {
			print("error:", error)
		}

		// do {
			
			
			// let path = Bundle.main.path(forResource: "input", ofType: "txt") // file path for file "data.txt"
			// let string = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
			// // let data = try String(contentsOf: URL(fileURLWithPath: inputPath))
			// // let data = try String(contentsOfFile: inputPath, encoding: .utf8)
			// // let data: NSData? = NSData(contentsOfFile: inputPath)

			// // let myStrings = data.components(separatedBy: .newlines)
			// print(type(of: string))
		// }
		// catch {
		// 	print(error)
		// }
	}
}



