@testable import SwiftAlgorithms

func makeBinaryTree() -> BinaryTreeNode<Int> {
    let eight = BinaryTreeNode(value: 8)
    let five = BinaryTreeNode(value: 5)
    let zero = BinaryTreeNode(value: 0)
    let one = BinaryTreeNode(value: 1)
    let nine = BinaryTreeNode(value: 9)
    let seven = BinaryTreeNode(value: 7)

    seven.addRight(nine)
    nine.addLeft(eight)

    seven.addLeft(one)
    one.addLeft(zero)
    one.addRight(five)

    return seven
}

func makeBinarySearchTree() -> BinarySearchTree<Int> {
    var tree = BinarySearchTree<Int>()
    tree.insert(7)
    tree.insert(9)
    tree.insert(8)
    tree.insert(5)
    tree.insert(1)
    tree.insert(0)

    return tree
}

func makeAVLTree() -> AVLTree<Int> {
    var tree = AVLTree<Int>()
    tree.insert(7)
    tree.insert(9)
    tree.insert(8)
    tree.insert(5)
    tree.insert(1)
    tree.insert(0)

    return tree
}
