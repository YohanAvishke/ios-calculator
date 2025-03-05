import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()
let calculator = Calculator()

print("Start your Calculation:")
if let input = readLine() {
    let inputArray = Array(input)
    let result: String = calculator.calculate(inputArray: inputArray)
    print(result)
} else {
    print("Calculation cannot be empty! (Calculation Example: 1 + 2)")
}

// TODO
// Decimal support
