import Foundation

class Calculator {
    var currentResult:String?
    
    func add(firstInput: Int, secondInput: Int) -> Int {
        return firstInput + secondInput
    }
    
    func calculate(args: [String]) -> String {
        for arg in args {
            
        }
        
//        let firstInput:Int? = inputArray[0].wholeNumberValue
//        let secondInput:Int? = inputArray[4].wholeNumberValue
//        
//        if (firstInput != nil) && (secondInput != nil) {
//            self.currentResult = String(add(firstInput: firstInput!, secondInput: secondInput!))
//        } else {
//            self.currentResult =  "Calculation should have valid numbers! (Calculation Example: 1 + 2)"
//        }
//        return currentResult!
    }
}
