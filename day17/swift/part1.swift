import Foundation

// Path to file
let filePath = "./input.txt"

var register_a: Int = 0
var register_b: Int = 0
var register_c: Int = 0
var instructions: [Int] = []
var output: [Int] = []

func get_combo(num: Int) -> Int {
    if num <= 3 {
        return num
    } else if num == 4 {
        return register_a
    } else if num == 5 {
        return register_b
    } else if num == 6 {
        return register_c
    }
    return 7
}

func opcode_0(combo_op: Int) {
    let output = register_a >> get_combo(num: combo_op)
    register_a = Int(output)
}

func opcode_1(num: Int) {
    register_b = register_b ^ num
}

func opcode_2(num: Int) {
    let output = get_combo(num: num) % 8
    register_b = output
}

func opcode_3(index: Int) -> Bool {
    if register_a != 0 {
        return true
    } else {
        return false
    }
}

func opcode_4() {
    register_b = register_b ^ register_c
}

func opcode_5(num: Int) {
    output.append(get_combo(num: num) % 8)
}

func opcode_6(combo_op: Int) {
    let output = register_a >> get_combo(num: combo_op)
    register_b = Int(output)
}

func opcode_7(combo_op: Int) {
    let output = register_a >> get_combo(num: combo_op)
    register_c = Int(output)
}

do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)

    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        if line.contains("Register") {
            if line.contains("A") {
                let num = line.split(separator: ": ").map { String($0) }
                register_a = Int(num[1])!
            }
            if line.contains("B") {
                let num = line.split(separator: ": ").map { String($0) }
                register_b = Int(num[1])!
            }
            if line.contains("C") {
                let num = line.split(separator: ": ").map { String($0) }
                register_c = Int(num[1])!
            }
        } else if line.contains("Program") {
            let nums = line.split(separator: ": ").map { String($0) }
            let instructs = nums[1].split(separator: ",").map { String($0) }
            for i in instructs {
                instructions.append(Int(i)!)
            }
        }
    }
} catch {
    print("Error reading file: \(error)")
}

var index = 0
while index < instructions.count - 1 {
    var opcode_3_result = false
    print("Running opcode", instructions[index])
    if instructions[index] == 0 {
        opcode_0(combo_op: instructions[index + 1])
    } else if instructions[index] == 1 {
        opcode_1(num: instructions[index + 1])
    } else if instructions[index] == 2 {
        opcode_2(num: instructions[index + 1])
    } else if instructions[index] == 3 {
        opcode_3_result = opcode_3(index: index)
    } else if instructions[index] == 4 {
        opcode_4()
    } else if instructions[index] == 5 {
        opcode_5(num: instructions[index + 1])
    } else if instructions[index] == 6 {
        opcode_6(combo_op: instructions[index + 1])
    } else if instructions[index] == 7 {
        opcode_7(combo_op: instructions[index + 1])
    }
    if opcode_3_result == true {
        index = instructions[index + 1]
    } else {
        index = index + 2
    }
}
print(output.map { String($0) }.joined(separator: ","))
