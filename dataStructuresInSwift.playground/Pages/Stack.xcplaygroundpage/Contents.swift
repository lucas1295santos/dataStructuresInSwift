/*:
 
 # Stack
 
 - Like linked lists or Arrays, Stack is a list-based collection.
 
 - Think of it like a representation of a stack of dishes in the sink. You pile them one on top of the other, so every time you add a new dish it to the stack, it is on top, and every time you remove a dish from the stack, you remove the top one
 
 - The stack theme is: Last in, first out
 
 -  Swift does not comes with a default implementation of Stack
*/

import LinkedList_PageSources

// Set up some nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)

// The generic value could be infered if I initialized this stack with a top node let stack = Stack(n1)
let stack = Stack<Int>()

print(stack.peek()?.value as Any) // nil

stack.push(n1)
print(stack.peek()!.value) // 1

stack.push(n2)
stack.push(n3)
print(stack.peek()!.value) // 3

print(stack.pop()!.value) // 3

print(stack.peek()!.value) // 2
