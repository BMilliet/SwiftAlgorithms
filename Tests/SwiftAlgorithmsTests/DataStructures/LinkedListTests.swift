import XCTest
@testable import SwiftAlgorithms

final class LinkedListTests: XCTestCase {

    func test_remove_occurences() throws {
        let list = LinkedList<Int>()

        list.push(4)
        list.push(2)
        list.push(2)
        list.push(1)
        list.push(3)
        list.push(2)
        list.push(2)

        XCTAssertEqual(4, list.removeAllOccurrences(2))

        var current = list.head
        while current != list.tail && current != nil {
            XCTAssertNotEqual(2, current?.value)
            current = current?.next
        }

        XCTAssertEqual(3, list.headValue)
        XCTAssertEqual(4, list.tailValue)
    }

    func test_merge_linkedLists() throws {
        let list  = LinkedList<Int>()
        let list2 = LinkedList<Int>()

        list.push(4)
        list.push(2)
        list2.push(3)
        list2.push(1)

        list.merge(list2)

        var current = list.head
        var prev: Node<Int>? = nil
        var counter = 1
        while current != list.tail && current != nil {
            XCTAssertEqual(counter, current?.value)
            XCTAssertEqual(prev, current?.parent)
            prev = current
            current = current?.next
            counter += 1
        }

        XCTAssertEqual(1, list.headValue)
        XCTAssertEqual(4, list.tailValue)
    }
    
    func test_merge_empty_linkedLists() throws {
        let list  = LinkedList<Int>()
        let list2 = LinkedList<Int>()

        list2.push(4)
        list2.push(3)
        list2.push(2)
        list2.push(1)

        list.merge(list2)

        var current = list.head
        var prev: Node<Int>? = nil
        var counter = 1
        while current != list.tail && current != nil {
            XCTAssertEqual(counter, current?.value)
            XCTAssertEqual(prev, current?.parent)
            prev = current
            current = current?.next
            counter += 1
        }

        XCTAssertEqual(1, list.headValue)
        XCTAssertEqual(4, list.tailValue)
    }

    func test_reverse_linedList() throws {
        let list = LinkedList<Int>()

        list.push(1)
        list.push(2)
        list.push(3)
        list.push(4)

        list.reversed()

        var current = list.head
        var prev: Node<Int>? = nil
        var counter = 1
        while current != list.tail && current != nil {
            XCTAssertEqual(counter, current?.value)
            XCTAssertEqual(prev, current?.parent)
            prev = current
            current = current?.next
            counter += 1
        }

        XCTAssertEqual(1, list.headValue)
        XCTAssertEqual(4, list.tailValue)
    }

    func test_get_middle() throws {
        let list = LinkedList<Int>()

        list.push(1)
        list.push(2)
        list.push(3)
        list.push(4)

        XCTAssertEqual(2, list.middle()?.value)

        list.push(5)

        XCTAssertEqual(3, list.middle()?.value)
    }

    func test_basic_linkedLists() throws {
        let list = LinkedList<Int>()
        list.push(4)

        XCTAssertEqual(4, list.headValue)
        XCTAssertEqual(4, list.tailValue)
        XCTAssertNil(list.head?.parent)

        list.push(3)

        XCTAssertEqual(3, list.headValue)
        XCTAssertEqual(4, list.tailValue)

        XCTAssertEqual(list.headValue, list.tail?.parent?.value)

        list.append(6)

        XCTAssertEqual(3, list.headValue)
        XCTAssertEqual(6, list.tailValue)

        list.push(2)
        list.push(1)

        let temp = list.find(value: 4)!
        list.insert(5, after: temp)

        XCTAssertEqual(5, temp.next!.value)
        XCTAssertEqual(3, temp.parent!.value)

        var current = list.head
        var prev: Node<Int>? = nil
        var counter = 1
        while current != list.tail && current != nil {
            XCTAssertEqual(counter, current?.value)
            XCTAssertEqual(prev, current?.parent)
            prev = current
            current = current?.next
            counter += 1
        }

        XCTAssertEqual(6, counter)

        let last = list.tail

        XCTAssertEqual(last, list.removeLast())
        XCTAssertEqual(5, list.tailValue)

        let oldHead = list.head

        XCTAssertEqual(oldHead, list.pop())
        XCTAssertEqual(2, list.headValue)
        XCTAssertNotNil(list.removeWhere(5))
        XCTAssertNotNil(list.removeAt(1))
        XCTAssertNotNil(list.removeAt(0))
    }
}
