/// Class to work with infix Strings
public struct PostFixExpression {
    // Function to determine the precedence of operators
    private func precedence(_ op: String) -> Int {
        switch op {
            case "^": return 3 // Highest precedence for exponentiation
            case "x", "/", "%": return 2 // Multiplication, division and modulus have higher precedence than addition/subtraction
            case "+", "-": return 1 // Lowest precedence for addition and subtraction
            default: return -1 // Return -1 for non-operator characters
        }
    }
    
    /// Function to convert an infix expression to postfix notation
    /// Eg: infix = a + b x c + d; postfix = a b c x + d +
    public func infixToPostfix(_ infix: [String]) -> [String] {
        var postFix: [String] = []
        var stack = Stack<String>()
        
        for elem in infix {
            if elem.isNumber {
                postFix.append(elem)
            }
            else {
                // operators are arranged according to match BODMAS rules
                while let top = stack.peek(), precedence(elem) <= precedence(top) {
                    postFix.append(stack.pop()!)
                }
                stack.push(elem)
            }
        }
        // Pop all the remaining operators from the stack and append to postfix expression
        while !stack.isEmpty {
            postFix.append(stack.pop()!)
        }
        
        return postFix
    }
}
