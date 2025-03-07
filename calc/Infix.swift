/// Class to work with infix Strings
struct Infix {
    // Function to determine the precedence of operators
    /// - Parameter char: The operator character
    /// - Returns: An integer representing the precedence level
    func precedence(_ char: Character) -> Int {
        switch char {
            case "^": return 3 // Highest precedence for exponentiation
            case "*", "/": return 2 // Multiplication and division have higher precedence than addition/subtraction
            case "+", "-": return 1 // Lowest precedence for addition and subtraction
            default: return -1 // Return -1 for non-operator characters
        }
    }
    
    /// Function to convert an infix expression to postfix notation
    /// - Parameter infix: The infix expression as a string
    /// - Returns: The equivalent postfix expression as a string
    func converterToPostfix(_ infix: String) -> String {
        var postFix: String = ""
        var stack = Stack()
        
        for char in infix {
            if char.isNumber {
                postFix.append(char)
            } else {
                while let top = stack.peek(), precedence(char) <= precedence(top) {
                    postFix.append(stack.pop()) // Pop higher or equal precedence operators from stack
                }
                stack.push(char)
            }
        }
        // Pop all the remaining operators from the stack and append to postfix expression
        while stack.peek() != nil {
            postFix.append(stack.pop())
        }
        
        return postFix
    }
}
