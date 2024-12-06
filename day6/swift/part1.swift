import Foundation

// Path to file
let filePath = "./input.txt"
var direction = 1
var temparr: [String] = []
var beentheredonethat: [String] = []
var count = 0

func patrol(arr: [String], line: Int, pos: Int) -> Bool {
    var newline = line
    var newpos = pos

    while true {

        if beentheredonethat.contains("\(newline),\(newpos)") == false {
            beentheredonethat.append("\(newline),\(newpos)")
        }
        if direction == 1 {
            if newline == 0 {
                return true
            }
            if Array(arr[newline - 1])[newpos] == "#" {
                direction = 2
                count = count + 1
            } else {
                if beentheredonethat.contains("\(newline),\(newpos)") {
                    newline = newline - 1
                } else {
                    count = count + 1
                    beentheredonethat.append("\(newline),\(newpos)")
                    newline = newline - 1
                }
            }
        } else if direction == 2 {
            if newpos == 129 {
                return true
            }
            if Array(arr[newline])[newpos + 1] == "#" {
                direction = 3
                count = count + 1
            } else {
                if beentheredonethat.contains("\(newline),\(newpos)") {
                    newpos = newpos + 1
                } else {
                    count = count + 1
                    beentheredonethat.append("\(newline),\(newpos)")
                    newpos = newpos + 1
                }
            }
        } else if direction == 3 {
            if newline == 129 {
                return true
            }
            if Array(arr[newline + 1])[newpos] == "#" {
                direction = 4
                count = count + 1
            } else {
                if beentheredonethat.contains("\(newline),\(newpos)") {
                    newline = newline + 1
                } else {
                    count = count + 1
                    beentheredonethat.append("\(newline),\(newpos)")
                    newline = newline + 1
                }
            }
        } else if direction == 4 {
            if newpos == 0 {
                return true
            }
            if Array(arr[newline])[newpos - 1] == "#" {
                direction = 1
                count = count + 1
            } else {
                if beentheredonethat.contains("\(newline),\(newpos)") {
                    newpos = newpos - 1
                } else {
                    count = count + 1
                    beentheredonethat.append("\(newline),\(newpos)")
                    newpos = newpos - 1
                }
            }
        }
    }
}

do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)

    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        temparr.append(line)
    }
} catch {
    print("Error reading file: \(error)")
}

var line = 0
var pos = 0
for i in temparr {
    pos = 0
    for j in i {
        if j == "^" {
            if patrol(arr: temparr, line: line, pos: pos) == true {
                break
            }
        }
        pos = pos + 1
    }
    line = line + 1
}

print(beentheredonethat.count)
