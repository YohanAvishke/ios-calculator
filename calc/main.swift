import Foundation

var args = ProcessInfo.processInfo.arguments

args.removeFirst()

if args.isEmpty {
    print("Invalid Calucation Expression!")
    exit(0)
}
let calculator = Calculator()
let result: String = calculator.calculate(args: args)
print(result)

// TODO
// Use regex instead Array(input)
// Decimal support
