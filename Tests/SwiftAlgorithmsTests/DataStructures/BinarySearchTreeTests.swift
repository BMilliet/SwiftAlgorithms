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
}
