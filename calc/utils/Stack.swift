import Foundation

/// To handle geenric errors of the Stack data type
enum StackError: Error {
    case emptyStack
}

/// Define a Stack data strcuture
struct Stack {
    private var items: [String] = []
    
    /// Access the items array and return the first item in a safe way
    /// - Returns: First element of 'items'
    func peek() throws -> String {
        // if topElement is null throw StackError
        guard let topElement = items.first else { throw StackError.emptyStack }
        return topElement
    }
    
    /// Remove and return the first item
    /// - Returns: First item of the Stack
    mutating func pop() -> String {
        return items.removeFirst()
    }
    
    /// Insert an item into the Stack
    /// - Parameter element: String to be insterted
    mutating func push(_ element: String) {
        items.insert(element, at: 0)
    }
}
