import XCTest
@testable import SwiftAlgorithms

final class LinkedListTests: XCTestCase {
    func test_push() {
        let list = LinkedList<Int>()

        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)

        list.push(1)

        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 1)

        list.push(2)
        list.push(3)


        XCTAssertEqual(list.head?.value, 3)
        XCTAssertEqual(list.tail?.value, 1)
    }

    func test_append() {
        let list = LinkedList<Int>()

        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)

        list.append(1)

        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 1)

        list.append(2)
        list.append(3)

        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 3)
    }

    func test_findByIndex_and_insertAfter() {
        let list = LinkedList<Int>()

        list.append(1)
        list.append(2)
        list.append(3)

        let two = list.node(i: 1)
        XCTAssertEqual(two?.value, 2)
        XCTAssertEqual(list.node(i: 0)?.value, 1)
        XCTAssertEqual(list.node(i: 2)?.value, 3)

        list.insert(v: 99, after: two!)
        XCTAssertEqual(list.node(i: 2)?.value, 99)

        list.insert(v: 100, after: list.tail!)

        XCTAssertEqual(list.tail?.value, 100)
    }

    func test_pop() {
        let list = LinkedList<Int>()

        list.append(1)
        list.append(2)
        list.append(3)

        XCTAssertEqual(list.pop()?.value, 1)
        XCTAssertEqual(list.pop()?.value, 2)
        XCTAssertEqual(list.pop()?.value, 3)
    }

    func test_removeLast() {
        let list = LinkedList<Int>()

        list.append(1)
        list.append(2)
        list.append(3)

        XCTAssertEqual(list.tail?.value, 3)
        XCTAssertEqual(list.removeLast()?.value, 3)
        XCTAssertEqual(list.tail?.value, 2)
        XCTAssertEqual(list.removeLast()?.value, 2)
        XCTAssertEqual(list.tail?.value, 1)
        XCTAssertEqual(list.removeLast()?.value, 1)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
    }

    func test_removeAfter() {
        let list = LinkedList<Int>()

        list.append(1)
        list.append(2)
        list.append(3)
        list.append(4)

        XCTAssertEqual(list.remove(after: list.node(i: 0)!)?.value, 2)
        XCTAssertEqual(list.remove(after: list.node(i: 1)!)?.value, 4)
        XCTAssertEqual(list.tail?.value, 3)
    }

    func test_find_middle() {
        let list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)
        list.push(4)
        list.push(5)

        XCTAssertEqual(list.middle()?.value, 3)
        list.pop()
        list.pop()
        XCTAssertEqual(list.middle()?.value, 2)
    }

    func test_reverse() {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)

        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 2)
        list.reverse()
        XCTAssertEqual(list.head?.value, 2)
        XCTAssertEqual(list.tail?.value, 1)
        XCTAssertEqual(list.head?.next?.value, list.tail?.value)



        list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)
        list.push(4)
        list.push(5)

        XCTAssertEqual(list.head?.value, 5)
        XCTAssertEqual(list.tail?.value, 1)
        list.reverse()
        XCTAssertEqual(list.head?.value, 1)
        XCTAssertEqual(list.tail?.value, 5)
    }

    func test_removeAllOccurrences() {
        let list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(2)
        list.push(3)
        list.push(4)
        list.push(4)

        list.removeAllOccurrences(of: 4)
        XCTAssertEqual(list.head?.value, 3)
        XCTAssertEqual(list.tail?.value, 1)
    }
}
