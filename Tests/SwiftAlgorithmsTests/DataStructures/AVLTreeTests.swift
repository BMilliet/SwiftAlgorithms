import XCTest
@testable import SwiftAlgorithms

final class AVLTreeTests: XCTestCase {

    func test_insert() throws {

        var n = [Int]()
        let tree = makeAVLTree()

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
        XCTAssertEqual(3, tree.height)
    }
}
