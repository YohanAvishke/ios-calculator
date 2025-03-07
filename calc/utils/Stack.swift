import Foundation

/// To handle geenric errors of the Stack data type
private enum StackError: Error {
    case emptyStack
}

/// Define a Stack data strcuture
public struct Stack <Element> {
    private var items: [Element] = []
    public var isEmpty: Bool {
        peek() == nil
    }
    
    /// Get the last item
    public func peek() -> Element? {
        return items.last
    }
    
    /// Remove and return the last item
    public mutating func pop() -> Element? {
        return items.popLast()
    }
    
    /// Insert an item to the end of the Stack
    public mutating func push(_ element: Element) {
        items.append(element)
    }
}
