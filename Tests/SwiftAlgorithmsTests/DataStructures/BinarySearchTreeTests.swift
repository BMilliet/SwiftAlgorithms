import XCTest
@testable import SwiftAlgorithms

final class BinarySearchTreeTests: XCTestCase {

    func test_insert() throws {

        var n = [Int]()
        var tree = BinarySearchTree<Int>()
        tree.root = makeBinaryTree()

        tree.insert(6)
        tree.insert(20)

        tree.root?.traverseInOrder { n.append($0.value) }

        let expected = [
            0,
            1,
            5,
            6,
            7,
            8,
            9,
            20
        ]

        XCTAssertEqual(expected, n)
    }

    func test_contains() throws {

        var tree = BinarySearchTree<Int>()
        tree.root = makeBinaryTree()

        XCTAssertTrue(tree.contains(7))
        XCTAssertTrue(tree.contains(9))
        XCTAssertFalse(tree.contains(40))
    }

    func test_find_most_left_node() throws {
        var tree = BinarySearchTree<Int>()
        tree.root = makeBinaryTree()

        let one = tree.find(1)
        let nine = tree.find(9)

        XCTAssertEqual(0, tree.root?.mostLeftNode()?.value)
        XCTAssertEqual(0, one?.mostLeftNode()?.value)
        XCTAssertEqual(8, nine?.mostLeftNode()?.value)
    }

    func test_remove_node() throws {

        var n = [Int]()
        var tree = BinarySearchTree<Int>()
        tree.root = makeBinaryTree()

        tree.remove(9)
        tree.root?.traverseInOrder { n.append($0.value) }

        let expected1 = [
            0,
            1,
            5,
            7,
            8,
        ]

        XCTAssertEqual(expected1, n)

        n = []
        tree.root = makeBinaryTree()
        tree.remove(8)
        tree.root?.traverseInOrder { n.append($0.value) }

        let expected2 = [
            0,
            1,
            5,
            7,
            9,
        ]

        XCTAssertEqual(expected2, n)
    }
}
