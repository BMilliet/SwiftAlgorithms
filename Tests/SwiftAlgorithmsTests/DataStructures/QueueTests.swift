import XCTest
@testable import SwiftAlgorithms

final class QueueTests: XCTestCase {
    func test() throws {
        var queueArr    = QueueArray<Int>()
        let queueList   = QueueLinkedList<Int>()
        var queueBuffer = QueueRingBuffer<Int>(size: 4)
        var queueStack  = QueueStack<Int>()

        queueArr.enqueue(1)
        queueArr.enqueue(2)
        queueArr.enqueue(3)
        queueArr.enqueue(4)

        queueList.enqueue(1)
        queueList.enqueue(2)
        queueList.enqueue(3)
        queueList.enqueue(4)

        queueBuffer.enqueue(1)
        queueBuffer.enqueue(2)
        queueBuffer.enqueue(3)
        queueBuffer.enqueue(4)

        queueStack.enqueue(1)
        queueStack.enqueue(2)
        queueStack.enqueue(3)
        queueStack.enqueue(4)

        XCTAssertFalse(queueArr.isEmpty)
        XCTAssertFalse(queueList.isEmpty)
        XCTAssertFalse(queueBuffer.isEmpty)
        XCTAssertFalse(queueStack.isEmpty)

        XCTAssertEqual(1, queueArr.peek)
        XCTAssertEqual(1, queueList.peek)
        XCTAssertEqual(1, queueBuffer.peek)
        XCTAssertEqual(1, queueStack.peek)

        XCTAssertEqual(1, queueArr.dequeue())
        XCTAssertEqual(1, queueList.dequeue())
        XCTAssertEqual(1, queueBuffer.dequeue())
        XCTAssertEqual(1, queueStack.dequeue())

        XCTAssertEqual(2, queueArr.peek)
        XCTAssertEqual(2, queueList.peek)
        XCTAssertEqual(2, queueBuffer.peek)
        XCTAssertEqual(2, queueStack.peek)

        queueArr.reverse()
        queueList.reverse()
        queueBuffer.reverse()
        queueStack.reverse()

        XCTAssertEqual(4, queueArr.peek)
        XCTAssertEqual(4, queueList.peek)
        XCTAssertEqual(4, queueBuffer.peek)
        XCTAssertEqual(4, queueStack.peek)
    }
}
