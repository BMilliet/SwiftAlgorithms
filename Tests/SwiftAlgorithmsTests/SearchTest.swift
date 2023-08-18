import XCTest
@testable import SwiftAlgorithms

final class SearchTests: XCTestCase {
    func test_binary() throws {

        let arr = [1,2,3,4,5,6,7,8,9,10]

        arr.forEach {
            XCTAssertEqual(($0 - 1), Search.binary(arr, target: $0))
        }

        XCTAssertNil(Search.binary(arr, target: 20))
    }
}
