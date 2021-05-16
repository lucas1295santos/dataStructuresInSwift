import Foundation

// MARK: - BinaryTree

public class BinaryTree {
    public var root: Node
    
    public init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }
    
    /// Traverse the tree in depth-first pre-order
    /// - Returns: A string with the values of each node concatenated in traverse order
    public func printTree() -> String {
        return preOrderPrint(currentTreeString: "", node: root)
    }
    
    private func preOrderPrint(currentTreeString: String, node: Node) -> String {
        var result = currentTreeString
        if result.isEmpty {
            result = "\(node.value)"
        } else {
            result.append(", \(node.value)")
        }
        
        if let leftNode = node.left {
            result = preOrderPrint(currentTreeString: result, node: leftNode)
        }
        if let rightNode = node.right {
            result = preOrderPrint(currentTreeString: result, node: rightNode)
        }
        
        return result
    }
    
    /// Traverse the tree searching for the value, returns as soon as a node with the value is found
    /// - Parameter value: The value to be searched
    /// - Returns: If there is a node with the give value in the tree
    public func contains(_ value: Int) -> Bool {
        return nodeContainsValue(root, value: value)
    }
    
    private func nodeContainsValue(_ node: Node?, value: Int) -> Bool {
        guard let node = node else { return false }
        return node.value == value
        || nodeContainsValue(node.left, value: value)
        || nodeContainsValue(node.right, value: value)
    }
}

// MARK: - Node

public class Node {
    public var value: Int
    public var left: Node?
    public var right: Node?

    public init(value: Int) {
        self.value = value
    }
}
