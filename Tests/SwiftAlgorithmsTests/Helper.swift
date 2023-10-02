@testable import SwiftAlgorithms

func makeBinaryTree() -> BinaryTreeNode<Int> {
    let eight = BinaryTreeNode(value: 8)
    let five = BinaryTreeNode(value: 5)
    let zero = BinaryTreeNode(value: 0)
    let one = BinaryTreeNode(value: 1)
    let nine = BinaryTreeNode(value: 9)
    let seven = BinaryTreeNode(value: 7)

    nine.leftChild = eight
    one.leftChild = zero
    one.rightChild = five
    seven.leftChild = one
    seven.rightChild = nine

    return seven
}
