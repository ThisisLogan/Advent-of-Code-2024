import Foundation

// Path to file
let filePath = "./input.txt"

// Arrays to store the first and second numbers
var firstnums: [Int] = []
var secondnums: [Int] = []

// Total Similarity
var totalsimilarity = 0

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

for i in 0...999 {
    var similarity = 0
    let count = secondnums.filter { $0 == firstnums[i] }.count
    if count > 0 {
        similarity = firstnums[i] * count
    }
    totalsimilarity = totalsimilarity + similarity
}
print(totalsimilarity)
