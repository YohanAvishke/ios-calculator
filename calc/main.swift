import Foundation

var args = ProcessInfo.processInfo.arguments

args.removeFirst()

let calculator = Calculator()
let result = calculator.calculate(args)
print(result)
