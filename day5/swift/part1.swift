import Foundation

// Path to file
let filePath = "./input.txt"
var rules: [String] = []
var updates: [String] = []
var total: Int = 0

func check_order(rules: [String], line: String) -> Bool {
    var safe: Bool = true
    let numbers = line.split(separator: ",").map { String($0) }
    for i in rules {
        let rule = i.split(separator: "|").map { String($0) }
        if numbers.contains(rule[0]) && numbers.contains(rule[1]) {
            if numbers.firstIndex(of: rule[0])!
                < numbers.firstIndex(of: rule[1])!
            {
            } else {
                safe = false
                break
            }
        }
    }
    if safe == true {
        return true
    }
    return false
}

do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)

    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        if line.contains("|") {
            rules.append(line)
        } else if line.contains(",") {
            updates.append(line)
        }
    }
} catch {
    print("Error reading file: \(error)")
}

for i in updates {
    if check_order(rules: rules, line: i) == true {
        let numbers = i.split(separator: ",").map { String($0) }
        let middle_num = numbers[numbers.count / 2]
        total = total + Int(middle_num)!
    }
}

print(total)
