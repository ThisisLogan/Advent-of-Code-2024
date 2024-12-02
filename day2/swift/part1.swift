import Foundation

// Path to file
let filePath = "./input.txt"

// Total Safe
var totalsafe = 0
var temparr: [Int] = []
do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
    var isok: Bool = false
    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        let numbers = line.split(separator: " ").map { String($0) }
        temparr = []
        for i in 0...numbers.count - 1 {
            temparr.append(Int(numbers[i])!)
        }
        for i in 0...temparr.count - 2 {
            if temparr[i] == temparr[i + 1] {
                isok = false
                break
            }
            if temparr[i] - temparr[i + 1] >= 1 && temparr[i] - temparr[i + 1] <= 3 {
                isok = true
            } else {
                isok = false
                break
            }
        }
        if isok == true {
            totalsafe = totalsafe + 1
            print(temparr)
        }
        temparr.reverse()
        for i in 0...temparr.count - 2 {
            if temparr[i] == temparr[i + 1] {
                isok = false
                break
            }
            if temparr[i] - temparr[i + 1] >= 1 && temparr[i] - temparr[i + 1] <= 3 {
                isok = true
            } else {
                isok = false
                break
            }
        }
        if isok == true {
            totalsafe = totalsafe + 1
            print(temparr)
        }
    }
} catch {
    print("Error reading file: \(error)")
}
print(totalsafe)
