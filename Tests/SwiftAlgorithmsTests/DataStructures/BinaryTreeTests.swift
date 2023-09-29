import XCTest
@testable import SwiftAlgorithms

final class BinaryTreeTests: XCTestCase {

    func test_traverse_in_order() throws {

        var n = [Int]()
        let tree = makeBinaryTree()

        tree.traverseInOrder { n.append($0.value) }

        let expected = [
            0,
            1,
            5,
            7,
            8,
            9
        ]

        XCTAssertEqual(expected, n)
    }

    func test_traverse_pre_order() throws {

        var n = [Int]()
        let tree = makeBinaryTree()

        tree.traversePreOrder { n.append($0.value) }

        let expected = [
            7,
            1,
            0,
            5,
            9,
            8
        ]

        XCTAssertEqual(expected, n)
    }

    func test_traverse_post_order() throws {

        var n = [Int]()
        let tree = makeBinaryTree()

        tree.traversePostOrder { n.append($0.value) }

        let expected = [
            0,
            5,
            1,
            8,
            9,
            7
        ]

        XCTAssertEqual(expected, n)
    }

    func test_tree_height() throws {

        var n = [0]
        var i = 0

        let tree = makeBinaryTree()

        tree.traversePreOrder {

            n[i] += 1

            if $0.leftChild == nil && $0.rightChild == nil {
                n.append(0)
                i += 1
            }
        }

        XCTAssertEqual(3, n.max())
    }

    func test_to_array() throws {

        let tree = makeBinaryTree()

        let expected = [
            7,
            1,
            0,
            5,
            9,
            8
        ]

        XCTAssertEqual(expected, tree.toArr())
    }

    func test_diserialize() throws {

        let arr = [15,10,5,nil,nil,12,nil,nil,25,17,nil,nil,nil]
        let tree = diserialize(arr)

        let expected = [
            15,
            10,
            5,
            12,
            25,
            17
        ]

        XCTAssertEqual(expected, tree!.toArr())
    }

    // Factory

    private func makeBinaryTree() -> BinaryTreeNode<Int> {
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

    private func diserialize<T>(_ arr: [T?]) -> BinaryTreeNode<T>? {
        var a = Array(arr.reversed())
        return _diserialize(&a)
    }

    private func _diserialize<T>(_ arr: inout [T?]) -> BinaryTreeNode<T>? {

        guard !arr.isEmpty, let v = arr.removeLast() else {
          return nil
        }

        let node = BinaryTreeNode(value: v)

        node.leftChild = _diserialize(&arr)
        node.rightChild = _diserialize(&arr)
        return node
    }
}
