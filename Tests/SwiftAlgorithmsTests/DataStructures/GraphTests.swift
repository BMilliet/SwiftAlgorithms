import XCTest
@testable import SwiftAlgorithms

final class GraphTests: XCTestCase {
    func test_graph_search() throws {

        let node9 = GraphNode(9)
        let node8 = GraphNode(8, next: [node9])
        let node7 = GraphNode(7)
        let node6 = GraphNode(6, next: [node7, node8])

        // circular reference
        node7.next = [node6]

        let node5 = GraphNode(5, next: [node6])
        let node4 = GraphNode(4, next: [node5])

        let node3 = GraphNode(3, next: [node4])
        let node2 = GraphNode(2, next: [node5])
        let node1 = GraphNode(1, next: [node2, node3])

        let graph = Graph(root: node1)

        XCTAssertEqual(node9, graph.search(node9))
        XCTAssertEqual(node9, graph.search(9))
    }
}
