import XCTest
@testable import SwiftAlgorithms

final class RingBufferTests: XCTestCase {
    func test() throws {

        var ringBuffer = RingBuffer<Int>(5)

        XCTAssertTrue(ringBuffer.isEmpty)
        XCTAssertFalse(ringBuffer.isFull)

        ringBuffer.write(1)

        XCTAssertEqual(1, ringBuffer.read())

        ringBuffer.write(2)
        ringBuffer.write(3)
        ringBuffer.write(4)
        ringBuffer.write(5)

        XCTAssertFalse(ringBuffer.isEmpty)
        XCTAssertTrue(ringBuffer.isFull)

        ringBuffer.write(6)

        XCTAssertEqual(2, ringBuffer.read())
        XCTAssertEqual(3, ringBuffer.read())
        XCTAssertEqual(4, ringBuffer.read())
        XCTAssertEqual(5, ringBuffer.read())
        XCTAssertEqual(6, ringBuffer.read())
    }

    func test_read() throws {

        var ringBuffer = RingBuffer<Int>(5)

        XCTAssertTrue(ringBuffer.isEmpty)
        XCTAssertFalse(ringBuffer.isFull)
        XCTAssertNil(ringBuffer.read())

        ringBuffer.write(1)

        XCTAssertEqual(1, ringBuffer.read())
        XCTAssertNil(ringBuffer.read())
    }
}
