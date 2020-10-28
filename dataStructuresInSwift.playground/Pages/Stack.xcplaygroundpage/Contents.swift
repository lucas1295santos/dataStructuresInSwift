/*:
 
 # Stack
 
 - Like linked lists or Arrays, Stack is a list-based collection.
 
 - Think of it like a representation of a stack of dishes in the sink. You pile them one on top of the other, so every time you add a new dish it to the stack, it is on top, and every time you remove a dish from the stack, you remove the top one
 
 - The stack theme is: Last in, first out
 
 -  Swift does not comes with a default implementation of Stack
*/

import LinkedList_PageSources

// The generic value could be infered if I initialized this stack with a top value let stack = Stack(1)
let stack = Stack<Int>()

print(stack.peek() as Any) // nil

stack.push(1)
print(stack.peek()!) // 1

stack.push(2)
stack.push(3)
print(stack.peek()!) // 3

print(stack.pop()!) // 3

print(stack.peek()!) // 2
