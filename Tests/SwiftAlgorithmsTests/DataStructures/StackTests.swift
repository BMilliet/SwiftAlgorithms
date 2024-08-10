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

    func test_reverse_array_with_stack() throws {
        let arr = [1,2,3,4]
        var stack = Stack(arr)

        XCTAssertEqual(4, stack.pop())
        XCTAssertEqual(3, stack.pop())
        XCTAssertEqual(2, stack.pop())
        XCTAssertEqual(1, stack.pop())
    }

    func test_balanced_parentheses_with_stack() throws {

        func isBalanced(_ str: String) -> Bool {

            var stack = Stack<Character>()

            str.forEach { x in
                if x == "(" {
                    stack.push(x)
                }

                if x == ")" {
                    if stack.peek == "(" {
                        stack.pop()
                    } else {
                        stack.push(x)
                    }
                }
            }

            return stack.isEmpty
        }

        let str1 = "h((e))llo(world)()"
        let str2 = "(hello world"

        XCTAssertTrue(isBalanced(str1))
        XCTAssertFalse(isBalanced(str2))
    }
}
