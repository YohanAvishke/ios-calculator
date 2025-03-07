import Foundation

/// To handle geenric errors of the Stack data type
enum StackError: Error {
    case emptyStack
}

/// Define a Stack data strcuture
struct Stack {
    private var items: [Character] = []
    
    /// Access the items array and return the first item or null
    /// - Returns: String
    func peek() -> Character? {
        return items.first
    }
    
    /// Remove and return the first item
    /// - Returns: String
    mutating func pop() -> Character {
        return items.removeFirst()
    }
    
    /// Insert an item into the Stack
    /// - Parameter element: String
    mutating func push(_ element: Character) {
        items.insert(element, at: 0)
    }
}
