import Foundation
import BinaryTree_PageSources

/*
 Let's initialize this tree
 
          0
        /   \
       1     2
      / \   / \
     3   4 5   6
    /
   7
 
 */

var tree = BinaryTree(rootValue: 0)
tree.root.left = Node(value: 1)
tree.root.right = Node(value: 2)
tree.root.left!.left = Node(value: 3)
tree.root.left!.right = Node(value: 4)
tree.root.right!.left = Node(value: 5)
tree.root.right!.right = Node(value: 6)
tree.root.left!.left!.left = Node(value: 7)

// Traverse the tree Depth-first (DFS) pre-order
print(tree.printTree()) // 0, 1, 3, 7, 4, 2, 5, 6
print(tree.contains(4)) // true
print(tree.contains(7)) // true
print(tree.contains(12)) // false
