public class Node {
    public var value: Int
    public var next: Node?
    
    public init(value: Int) {
        self.value = value
    }
}

public class LinkedList {
    
    public var head: Node?
    
    public init(head: Node?) {
        self.head = head
    }
    
    public func append(_ node: Node) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    // Get a node from a particular position.
    // Assume the first position is "1".
    // Return "nil" if position is not in the list.
    public func getNode(atPosition position: Int) -> Node? {
        guard head != nil else { return nil }
        guard position > 1 else { return head }
        var node = head
        
        for _ in 1 ..< position {
            let next = node?.next
            node = next
        }
        
        return node
    }
    
    // Insert a new node at the given position.
    // Assume the first position is "1".
    // Inserting at position 3 means between
    // the 2nd and 3rd nodes.
    public func insertNode(_ node: Node, at position: Int) {
        var currentNode = head
        
        for _ in 2 ..< position {
            let nextNode = currentNode?.next
            currentNode = nextNode
        }
        
        let currentNextNode = currentNode?.next
        currentNode?.next = node
        currentNode?.next?.next = currentNextNode
    }
    
    // Delete the first node with a given value.
    public func deleteNode(withValue value: Int) {
        guard let head = self.head else { return }
        
        if head.value == value {
            let next = head.next
            self.head = next
            return
        }
        
        var currentNode = head
                
        while let nextNode = currentNode.next {
            if nextNode.value == value {
                let newNextNode = nextNode.next
                currentNode.next = newNextNode
                return
            }
            currentNode = nextNode
        }
    }
}
