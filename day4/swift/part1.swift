import Foundation

// Path to file
let filePath = "./input.txt"

var total: Int = 0
var linenum: Int = 0
var charnum: Int = 0
var temparr: [String] = []

func check_adj(arr: [String], line: Int, index: Int) {
    if line == 0 {
        if index == 0 {
            for i in 0...1 {
                for j in 0...1 {
                    if Array(arr[line + i])[index + j] == "M" {
                        if Array(arr[line + i + i])[index + j + j] == "A" {
                            if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                total = total + 1
                            }
                        }
                    }
                }
            }
        } else if index == 140 {
            for i in 0...1 {
                for j in -1...0 {
                    if Array(arr[line + i])[index + j] == "M" {
                        if Array(arr[line + i + i])[index + j + j] == "A" {
                            if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                total = total + 1
                            }
                        }
                    }
                }
            }
        } else {
            for i in 0...1 {
                for j in -1...1 {
                    if line + i + i + i >= Array(arr[line]).count || index + j + j + j >= 140
                        || line + i + i + i <= -1
                        || index + j + j + j <= -1
                    {
                        continue
                    } else {
                        if Array(arr[line + i])[index + j] == "M" {
                            if Array(arr[line + i + i])[index + j + j] == "A" {
                                if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                    total = total + 1
                                }
                            }
                        }
                    }
                }
            }
        }
    } else if line == Array(arr[line]).count {
        if index == 0 {
            for i in -1...0 {
                for j in 0...1 {
                    if Array(arr[line + i])[index + j] == "M" {
                        if Array(arr[line + i + i])[index + j + j] == "A" {
                            if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                total = total + 1
                            }
                        }
                    }
                }
            }
        } else if index == 140 {
            for i in -1...0 {
                for j in -1...0 {
                    if Array(arr[line + i])[index + j] == "M" {
                        if Array(arr[line + i + i])[index + j + j] == "A" {
                            if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                total = total + 1
                            }
                        }
                    }
                }
            }
        } else {
            for i in -1...0 {
                for j in -1...1 {
                    if line + i + i + i >= Array(arr[line]).count || index + j + j + j >= 140
                        || line + i + i + i <= -1
                        || index + j + j + j <= -1
                    {
                        continue
                    } else {
                        if Array(arr[line + i])[index + j] == "M" {
                            if Array(arr[line + i + i])[index + j + j] == "A" {
                                if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                    total = total + 1
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if index == 0 {
            for i in -1...1 {
                for j in 0...1 {
                    if Array(arr[line + i])[index + j] == "M" {
                        if Array(arr[line + i + i])[index + j + j] == "A" {
                            if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                total = total + 1
                            }
                        }
                    }
                }
            }
        } else if index == 140 {
            for i in -1...1 {
                for j in -1...0 {
                    if Array(arr[line + i])[index + j] == "M" {
                        if Array(arr[line + i + i])[index + j + j] == "A" {
                            if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                total = total + 1
                            }
                        }
                    }
                }
            }
        } else {
            for i in -1...1 {
                for j in -1...1 {
                    if line + i + i + i >= 140 || index + j + j + j >= 140 || line + i + i + i <= -1
                        || index + j + j + j <= -1
                    {
                        continue
                    } else {

                        if Array(arr[line + i])[index + j] == "M" {
                            if Array(arr[line + i + i])[index + j + j] == "A" {
                                if Array(arr[line + i + i + i])[index + j + j + j] == "S" {
                                    total = total + 1
                                }
                            }
                        }
                    }
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
for i in temparr {
    charnum = 0
    for j in i {
        if j == "X" {
            check_adj(arr: temparr, line: linenum, index: charnum)
        }
        charnum = charnum + 1
    }
    linenum = linenum + 1
}
print(total)
