import Foundation

var args = ProcessInfo.processInfo.arguments

args.removeFirst()

let calculator = Calculator()
//let result = calculator.calculate(["83", "%", "9"])
let result = calculator.calculate(args)
print(result)

/* Todo
 Setup bracket support to Infix to Postfix converter
 Decimal support
 */
