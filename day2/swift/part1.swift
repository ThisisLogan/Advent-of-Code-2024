import Foundation

// Path to file
let filePath = "./input.txt"

// Total Safe
var totalsafe = 0

var temparr: [Int] = []

func is_safe(array: [Int]) -> Bool {
    var isok: Bool = false
    for i in 0...array.count - 2 {
        if array[i] - array[i + 1] >= 1 && array[i] - array[i + 1] <= 3 {
            isok = true
        } else {
            isok = false
            break
        }
    }
    if isok == true {
        return true
    } else {
        return false
    }
}

do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        let numbers = line.split(separator: " ").map { String($0) }
        temparr = []
        for i in 0...numbers.count - 1 {
            temparr.append(Int(numbers[i])!)
        }

        if is_safe(array: temparr) == false {
            temparr.reverse()
            if is_safe(array: temparr) == true {
                totalsafe = totalsafe + 1
            }
        } else {
            totalsafe = totalsafe + 1
        }
    }
} catch {
    print("Error reading file: \(error)")
}
print(totalsafe)
