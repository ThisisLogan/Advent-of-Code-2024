import Foundation

// Enum for directions
enum Direction: Int {
    case up = 1
    case right = 2
    case down = 3
    case left = 4

    mutating func rotate() {
        self = Direction(rawValue: rawValue % 4 + 1)!
    }
}

// Structure to represent a position
struct Position: Hashable {
    let line: Int
    let pos: Int
    let direction: Direction

    func hash(into hasher: inout Hasher) {
        hasher.combine(line)
        hasher.combine(pos)
        hasher.combine(direction.rawValue)
    }
}

let filePath = "./input.txt"
var temparr: [String] = []
var count = 0

func findStart(arr: [String]) -> (line: Int, pos: Int)? {
    for (lineNum, line) in arr.enumerated() {
        if let pos = line.firstIndex(of: "^") {
            return (lineNum, line.distance(from: line.startIndex, to: pos))
        }
    }
    return nil
}

func patrol(arr: [String], startLine: Int, startPos: Int) -> Bool {
    var currentLine = startLine
    var currentPos = startPos
    var direction = Direction.up
    var seen = Set<Position>()

    let rows = arr.count
    let cols = arr[0].count

    func isValidMove(_ line: Int, _ pos: Int) -> Bool {
        return line >= 0 && line < rows && pos >= 0 && pos < cols
    }

    func getNextPosition() -> (Int, Int) {
        switch direction {
        case .up:
            return (currentLine - 1, currentPos)
        case .right:
            return (currentLine, currentPos + 1)
        case .down:
            return (currentLine + 1, currentPos)
        case .left:
            return (currentLine, currentPos - 1)
        }
    }

    while true {
        let position = Position(line: currentLine, pos: currentPos, direction: direction)

        if seen.contains(position) {
            return true  // Loop detected
        }
        seen.insert(position)

        let (nextLine, nextPos) = getNextPosition()

        if !isValidMove(nextLine, nextPos) {
            return false  // Out of bounds
        }

        let nextChar = arr[nextLine][
            arr[nextLine].index(arr[nextLine].startIndex, offsetBy: nextPos)]

        if nextChar == "#" {
            direction.rotate()
        } else {
            currentLine = nextLine
            currentPos = nextPos
        }
    }
}

// Read input file
do {
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
    temparr = fileContent.components(separatedBy: .newlines).filter { !$0.isEmpty }
} catch {
    print("Error reading file: \(error)")
}

// Process each position
for line in 0..<temparr.count {
    print("Line:", line)
    for pos in 0..<temparr[line].count {
        let currentChar = temparr[line][
            temparr[line].index(temparr[line].startIndex, offsetBy: pos)]
        if currentChar == "." {
            var newarr = temparr
            var chars = Array(temparr[line])
            chars[pos] = "#"
            newarr[line] = String(chars)

            if let start = findStart(arr: newarr) {
                if patrol(arr: newarr, startLine: start.line, startPos: start.pos) {
                    count += 1
                }
            }
        }
    }
}

print("Final count:", count)
