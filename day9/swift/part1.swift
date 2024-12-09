import Foundation

let filePath = "./input.txt"
var count = 0
var temparr: [String] = []
var diskarr: [String] = []
var file: Bool = true
var total = 0

func sort_block(arr: [String]) -> [String] {
    print("Sorting arr")
    var sorted_arr = arr
    while true {
        if sorted_arr.contains(".") {
            sorted_arr.swapAt(sorted_arr.firstIndex(of: ".")!, sorted_arr.count - 1)
            if sorted_arr.last == "." {
                sorted_arr.removeLast()
            }
        } else {
            return sorted_arr
        }
    }
    return []
}

func calculate_block(arr: [String]) -> Int {
    print("Calculating arr")
    var char = 0
    for i in 0...arr.count - 1 {
        total = total + Int(arr[i])! * char
        char = char + 1
    }
    return total
}

do {
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
    fileContent.enumerateLines { line, _ in
        temparr.append(line)

    }
} catch {
    print("Error reading file: \(error)")
}

for i in temparr {
    for j in i {
        for p in 0...j.wholeNumberValue! {
            if p != 0 {
                if file == true {
                    diskarr.append(String(count))
                } else {
                    diskarr.append(".")
                }
            }
        }
        if file == true {
            count = count + 1
            file = false
        } else if file == false {
            file = true
        }
    }

}
print("Running funcs")
print(calculate_block(arr: sort_block(arr: diskarr)))
