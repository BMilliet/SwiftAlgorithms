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
