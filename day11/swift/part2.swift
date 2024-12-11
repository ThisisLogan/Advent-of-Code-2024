import Foundation

// Path to file
let filePath = "./input.txt"

var total: Int = 0

var temparr: [Int] = []
var stones: [Int: Int] = [:]

func blink(stone: Int) -> [Int] {
    if stone == 0 {
        return [1]
    } else if Int(String(stone).count) % 2 == 0 {
        let midpoint = String(stone).count / 2
        let firstHalf = String(String(stone).prefix(midpoint))
        let secondHalf = String(String(stone).suffix(String(stone).count - midpoint))
        return [Int(firstHalf)!, Int(secondHalf)!]
    } else {
        return [stone * 2024]
    }
}

func count_stones(arr: inout [Int]) -> Int {
    for i in arr {
        if stones[i] != nil {
            stones[i] = stones[i]! + 1
        } else {
            stones[i] = 1
        }
    }
    print(stones)
    for num in 1...75 {
        print(num)
        //print(stones)
        var new_stones: [Int: Int] = [:]
        for i in stones {
            let blinked = blink(stone: i.key)
            for p in blinked {
                new_stones[p] = (new_stones[p] ?? 0) + i.value
            }
            stones = new_stones
        }

    }
    for i in stones {
        total = total + i.value
    }
    return total
}

do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        let numbers = line.split(separator: " ").map { String($0) }
        for i in 0...numbers.count - 1 {
            temparr.append(Int(numbers[i])!)
        }
    }
} catch {
    print("Error reading file: \(error)")
}

print(count_stones(arr: &temparr))
