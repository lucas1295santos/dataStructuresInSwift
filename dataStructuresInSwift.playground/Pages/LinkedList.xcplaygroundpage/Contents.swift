
/*:
 
 # LinkedList
 
 - Linked list is list based collection. Think of it like a list, but with no concept of indexes.

 - Data is structured by linking nodes. Each node holds a pointer to the next one, forming this links.

 - It is less versatile than a list, but there are effieciency trade-offs to consider:
    - Insertions and deletions can be done in O(1) if you have the reference to the nodes you need to do the operation (constant time).
    - Since it does not have indexing, getting an arbitrary element will be slower.
    - If you wan't to know more about complexity on Linked Lists and other data structures, refer to [this cheatSheet](https://www.bigocheatsheet.com)
 
 -  Swift does not comes with a default implementation of LinkedList
 
 - Check the file Sources/LinkedLits.swift to see implementation
 
 - Learn more at: [cs.cmu.edu](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Linked%20Lists/linked%20lists.html)
 
 - Note: don't force unwrap on your real projects!
*/

// Set up some nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Both in nodes and LinkedList, the generic value T is infered as int
let linkedList = LinkedList(head: n1)

print(linkedList.head!.value) // 1

linkedList.addFirst(node: n2)

print("\(linkedList.head!.value), \(linkedList.head!.next!.value)") // 2, 1

linkedList.addLast(node: n3)
print(
    "\(linkedList.head!.value), " +
    "\(linkedList.head!.next!.value), " +
    "\(linkedList.head!.next!.next!.value)"
) // 2, 1, 3

linkedList.addAfter(n4, nodeWithValue: 1)

print(
    "\(linkedList.head!.value), " +
    "\(linkedList.head!.next!.value), " +
    "\(linkedList.head!.next!.next!.value), " +
    "\(linkedList.head!.next!.next!.next!.value)"
) // 2, 1, 4, 3

linkedList.deleteFirst(nodeWithValue: 1)

print(
    "\(linkedList.head!.value), " +
    "\(linkedList.head!.next!.value), " +
    "\(linkedList.head!.next!.next!.value)"
) // 2, 4, 3

linkedList.addBefore(n1, nodeWithValue: 3)

print(
    "\(linkedList.head!.value), " +
    "\(linkedList.head!.next!.value), " +
    "\(linkedList.head!.next!.next!.value), " +
    "\(linkedList.head!.next!.next!.next!.value)"
) // 2, 4, 1, 3
