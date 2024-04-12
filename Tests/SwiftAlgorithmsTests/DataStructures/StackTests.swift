import XCTest
@testable import SwiftAlgorithms

final class StackTests: XCTestCase {
    func test_stack() throws {
        var stack = Stack<Int>([1,2,3])

        stack.push(4)
        
        XCTAssertEqual(4, stack.pop())
        XCTAssertEqual(3, stack.pop())
        XCTAssertEqual(2, stack.pop())

        XCTAssertEqual(1, stack.peek)
        XCTAssertEqual(1, stack.pop())

        XCTAssertTrue(stack.isEmpty)
        XCTAssertNil(stack.peek)
    }
}
