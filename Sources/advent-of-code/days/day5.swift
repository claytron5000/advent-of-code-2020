import Foundation

func main() {
    let file = AppFile(fileName: "day5.txt")
    let content = file.readDocument();

    let lines = content.components(separatedBy: .newlines)
    
    var seats: Array<Int> = []
    for line in lines {
        let num = getSeatNumber(seat: line)
        seats.append(num)
    }
    seats.sort()
    var start = 0;
    for (index, seat) in seats.enumerated() {
        
        if index == 0 {
            start = seat
        }
        else if seat != index + start {
            print(index+start, seat)
            break
        }
    }

}

func getSeatNumber(seat: String) -> Int
{
    var row = ""
    var col = ""
    for char in seat {
        if char == "F" {
            row = row + "0"
        }
        else if char == "B" {
            row = row + "1"
        }
        else if char == "R" {
            col = col + "1"
        }
        else if char == "L" {
            col = col + "0"
        }
    }
    if let rowInt = Int(row, radix: 2) {
        if let colInt = Int(col, radix: 2) {
            return rowInt * 8 + colInt
        }
        else {
            return 0
        }
    }
    else {
        return 0
    }
}



