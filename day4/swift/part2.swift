import Foundation

// Path to file
let filePath = "./input.txt"

var total: Int = 0
var linenum: Int = 0
var charnum: Int = 0
var temparr: [String] = []

func check_adj(arr: [String], line: Int, index: Int) {
    if line == 0 {
    } else if line == 139 {
    } else {
        if index == 0 {
        } else if index == 139 {
        } else {
            if Array(arr[line - 1])[index - 1] == "M" && Array(arr[line - 1])[index + 1] == "M"
                && Array(arr[line + 1])[index - 1] == "S" && Array(arr[line + 1])[index + 1] == "S"
            {
                total = total + 1
            }
            if Array(arr[line - 1])[index - 1] == "M" && Array(arr[line - 1])[index + 1] == "S"
                && Array(arr[line + 1])[index - 1] == "M" && Array(arr[line + 1])[index + 1] == "S"
            {
                total = total + 1
            }
            if Array(arr[line - 1])[index - 1] == "S" && Array(arr[line - 1])[index + 1] == "S"
                && Array(arr[line + 1])[index - 1] == "M" && Array(arr[line + 1])[index + 1] == "M"
            {
                total = total + 1
            }
            if Array(arr[line - 1])[index - 1] == "S" && Array(arr[line - 1])[index + 1] == "M"
                && Array(arr[line + 1])[index - 1] == "S" && Array(arr[line + 1])[index + 1] == "M"
            {
                total = total + 1
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
for i in temparr {
    charnum = 0
    for j in i {
        if j == "A" {
            check_adj(arr: temparr, line: linenum, index: charnum)
        }
        charnum = charnum + 1
    }
    linenum = linenum + 1
}
print(total)
