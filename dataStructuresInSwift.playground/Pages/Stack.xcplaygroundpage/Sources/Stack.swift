import Foundation
import LinkedList_PageSources

public class Stack<T: Equatable> {
    
    private var linkedList: LinkedList<T>
    
    public init(top: T? = nil) {
        if let topValue = top {
            self.linkedList = LinkedList(head: .init(value: topValue))
        } else {
            self.linkedList = LinkedList<T>()
        }
    }
    
    public func push(_ value: T) {
        linkedList.addFirst(node: .init(value: value))
    }
    
    public func pop() -> T? {
        let head = linkedList.head
        linkedList.head = head?.next
        return head?.value
    }
    
    public func peek() -> T? {
        return linkedList.head?.value
    }
}
