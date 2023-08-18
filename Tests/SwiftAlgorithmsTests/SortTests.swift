import XCTest
@testable import SwiftAlgorithms

final class SortTests: XCTestCase {
    func test_quickSort() throws {

        let arr = [1,3,6,2,5,4,10,8,9,7]
        let sorted = Sort.quick(arr)

        var count = 1
        sorted.forEach { 
            XCTAssertEqual(count, $0)
            count += 1
        }
    }

    func test_quickSort_reversed() throws {

        let arr = [1,3,6,2,5,4,10,8,9,7]
        let sorted = Sort.quickReversed(arr)

        var count = 10
        sorted.forEach { 
            XCTAssertEqual(count, $0)
            count -= 1
        }
    }
}
