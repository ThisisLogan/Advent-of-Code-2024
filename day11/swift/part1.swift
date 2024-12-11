import Foundation

// Path to file
let filePath = "./input.txt"

var total: Int = 0

var temparr: [Int] = []

func blink(arr: inout [Int]) {
    for _ in 1...25 {
        var index = 0
        for i in arr {
            if i == 0 {
                arr[index] = 1
            } else if Int(String(i).count) % 2 == 0 {
                let midpoint = String(i).count / 2
                let firstHalf = String(String(i).prefix(midpoint))
                let secondHalf = String(String(i).suffix(String(i).count - midpoint))
                arr[index] = Int(firstHalf)!
                index = index + 1
                arr.insert(Int(secondHalf)!, at: index)
            } else {
                arr[index] = arr[index] * 2024
            }
            index = index + 1
        }
    }
    print(arr.count)
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

blink(arr: &temparr)
