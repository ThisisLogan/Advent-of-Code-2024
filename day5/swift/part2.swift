import Foundation

// Path to file
let filePath = "./input.txt"
var rules: [String] = []
var updates: [String] = []
var total: Int = 0

func check_order(rules: [String], line: String) -> (Bool, String) {
    var safe: Bool = true
    var numbers = line.split(separator: ",").map { String($0) }
    for i in rules {
        let rule = i.split(separator: "|").map { String($0) }
        if numbers.contains(rule[0]) && numbers.contains(rule[1]) {
            if numbers.firstIndex(of: rule[0])!
                < numbers.firstIndex(of: rule[1])!
            {
            } else {
                safe = false
                numbers.swapAt(numbers.firstIndex(of: rule[0])!, numbers.firstIndex(of: rule[1])!)
                return (false, numbers.joined(separator: ","))
            }
        }
    }
    return (true, "")
}

func fix_order(rules: [String], line: String) -> (Bool, String) {
    var numbers = line.split(separator: ",").map { String($0) }
    for i in rules {
        let rule = i.split(separator: "|").map { String($0) }
        if numbers.contains(rule[0]) && numbers.contains(rule[1]) {
            if numbers.firstIndex(of: rule[0])!
                < numbers.firstIndex(of: rule[1])!
            {
            } else {
                numbers.swapAt(numbers.firstIndex(of: rule[0])!, numbers.firstIndex(of: rule[1])!)
                return (false, numbers.joined(separator: ","))
            }
        }
    }
    return (true, numbers.joined(separator: ","))
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
    let check = check_order(rules: rules, line: i)
    if check.0 == true {
    } else {
        let items = check.1
        let items2 = fix_order(rules: rules, line: items)
        var current = items2
        while true {
            current = fix_order(rules: rules, line: current.1)
            if current.0 == true { break }
        }
        let numbers = current.1.split(separator: ",").map { String($0) }
        if numbers.isEmpty {
        } else {
            let middle_num = numbers[numbers.count / 2]
            total = total + Int(middle_num)!
        }
    }
}

print(total)
