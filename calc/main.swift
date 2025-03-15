import Foundation

var args = ProcessInfo.processInfo.arguments

args.removeFirst() // First input is not part of the calculation

let calculator = Calculator()
let result = calculator.calculate(args) // calculate
print(result)
