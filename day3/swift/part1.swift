import Foundation

// Path to file
let filePath = "./input.txt"

var final_count: Int = 0

func matches(for regex: String, in text: String) -> [String] {

    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(
            in: text,
            range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
do {
    // Load the content of the file
    let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)

    // Read the file line by line
    fileContent.enumerateLines { line, _ in
        let matched = matches(for: #"mul\([0-9]{1,3},[0-9]{1,3}\)"#, in: line)
        for i in 0...matched.count - 1 {
            let nums = matches(for: #"[0-9]{1,3},[0-9]{1,3}"#, in: matched[i])
            let numbers = nums[0].split(separator: ",")
            final_count = final_count + (Int(numbers[0])! * Int(numbers[1])!)
        }

    }
} catch {
    print("Error reading file: \(error)")
}
print(final_count)
