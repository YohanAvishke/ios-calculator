import Foundation

var args = ProcessInfo.processInfo.arguments

args.removeFirst()

let calculator = Calculator()
let result = calculator.calculate(args)
print(result)

/* Todo
 Setup bracket support
 Decimal support
 More validations
 Exception handling
 */
