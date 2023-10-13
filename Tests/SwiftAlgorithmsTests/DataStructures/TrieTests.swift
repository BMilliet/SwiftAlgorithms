import XCTest
@testable import SwiftAlgorithms

final class TrieTests: XCTestCase {

    func test_insert_contains_remove() throws {

        let trie = Trie<String>()

        trie.insert("coffe")

        XCTAssertTrue(trie.contains("coffe"))

        trie.remove("coffe")

        XCTAssertFalse(trie.contains("coffe"))

        trie.insert("cut")
        trie.insert("cutter")
        
        XCTAssertEqual(2, trie.collections(startingWith: "c").count) 
    }
}
