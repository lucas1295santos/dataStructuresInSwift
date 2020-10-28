import Foundation
import LinkedList_PageSources

public class Stack<T: Equatable> {
    
    private var linkedList: LinkedList<T>
    
    public init(top: Node<T>? = nil) {
        self.linkedList = LinkedList(head: top)
    }
    
    public func push(_ node: Node<T>) {
        linkedList.addFirst(node: node)
    }
    
    public func pop() -> Node<T>? {
        let head = linkedList.head
        linkedList.head = head?.next
        return head
    }
    
    public func peek() -> Node<T>? {
        return linkedList.head
    }
}
