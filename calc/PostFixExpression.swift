/// Class to work with infix Strings
public struct PostFixExpression {
    // Function to determine the precedence of operators
    private func precedence(_ char: Character) -> Int {
        switch char {
            case "^": return 3 // Highest precedence for exponentiation
            case "x", "/", "%": return 2 // Multiplication, division and modulus have higher precedence than addition/subtraction
            case "+", "-": return 1 // Lowest precedence for addition and subtraction
            default: return -1 // Return -1 for non-operator characters
        }
    }
    
    /// Function to convert an infix expression to postfix notation
    /// Eg: infix = a + b x c + d; postfix = a b c x + d +
    public func infixToPostfix(_ infix: String) -> String {
        var postFix: String = ""
        var stack = Stack<Character>()
        var previousChar: Character?
        
        for char in infix {
            if char.isNumber {
                postFix.append(char)
            } else if char == "-" {
                // Identify negative numbers
                // Treat "-x" as "0 - x"
                if previousChar == nil || !previousChar!.isNumber {
                    postFix.append("0")
                }
                while let top = stack.peek(), precedence(char) <= precedence(top) {
                    postFix.append(stack.pop()!)
                }
                stack.push(char)
            } else {
                // operators are arranged according to match BODMAS rules
                while let top = stack.peek(), precedence(char) <= precedence(top) {
                    postFix.append(stack.pop()!)
                }
                stack.push(char)
            }
            previousChar = char
        }
        // Pop all the remaining operators from the stack and append to postfix expression
        while !stack.isEmpty {
            postFix.append(stack.pop()!)
        }
        
        return postFix
    }
}
