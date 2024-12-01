import Foundation

// Path to file
let filePath = "./input.txt"

// Arrays to store the first and second numbers
var firstnums: [Int] = []
var secondnums: [Int] = []

// Total Distance
var totaldistance = 0

do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)

    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        let numbers = line.split(separator: " ").map { String($0) }

        if numbers.count == 2,
            let number1 = Int(numbers[0]),
            let number2 = Int(numbers[1])
        {
            // Append numbers to the respective arrays
            firstnums.append(number1)
            secondnums.append(number2)
        }
    }
} catch {
    print("Error reading file: \(error)")
}

// Sort the arrays
firstnums.sort()
secondnums.sort()

for i in 0...999 {
    var distance = 0
    if firstnums[i] > secondnums[i] {
        distance = firstnums[i] - secondnums[i]
    } else {
        distance = secondnums[i] - firstnums[i]
    }
    totaldistance = totaldistance + distance
}
print(totaldistance)
