import XCTest
@testable import SwiftAlgorithms

final class AVLTreeTests: XCTestCase {

    func test_height() throws {

        var n = [Int]()
        let tree = makeUnbalancedAVLTree()

        tree.root?.traverseInOrder { n.append($0.value) }

        let expected = [
            0,
            1,
            5,
            7,
            8,
            9,
        ]

        XCTAssertEqual(expected, n)
        XCTAssertTrue(tree.isBalanced)
        XCTAssertEqual(4, tree.height)
    }

    func test_left_rotation() throws {

        var tree = AVLTree<Int>()
        tree.insert(30)
        tree.insert(20)
        tree.insert(10)

        XCTAssertFalse(tree.isBalanced)
        XCTAssertEqual(3, tree.height)
        tree.balance()
        XCTAssertTrue(tree.isBalanced)
        XCTAssertEqual(2, tree.height)
    }

    func test_right_rotation() throws {

        var tree = AVLTree<Int>()
        tree.insert(10)
        tree.insert(20)
        tree.insert(30)

        XCTAssertFalse(tree.isBalanced)
        XCTAssertEqual(3, tree.height)
        tree.balance()
        XCTAssertTrue(tree.isBalanced)
        XCTAssertEqual(2, tree.height)
    }

    func test_left_right_rotation() throws {

        var tree = AVLTree<Int>()
        tree.insert(30, balanced: false)
        tree.insert(10, balanced: false)
        tree.insert(20, balanced: false)

        XCTAssertFalse(tree.isBalanced)
        XCTAssertEqual(3, tree.height)
        tree.balance()
        XCTAssertTrue(tree.isBalanced)
        XCTAssertEqual(2, tree.height)
    }

    func test_right_left_rotation() throws {

        var tree = AVLTree<Int>()
        tree.insert(10, balanced: false)
        tree.insert(30, balanced: false)
        tree.insert(20, balanced: false)

        XCTAssertFalse(tree.isBalanced)
        XCTAssertEqual(3, tree.height)
        tree.balance()
        XCTAssertTrue(tree.isBalanced)
        XCTAssertEqual(2, tree.height)
    }

    func test_incert_balance() throws {
        var tree = AVLTree<Int>()
        tree.insert(10)
        tree.insert(30)
        tree.insert(20)

        XCTAssertTrue(tree.isBalanced)

        tree.insert(100)
        tree.insert(80)
        tree.insert(50)

        XCTAssertTrue(tree.isBalanced)
    }
}
