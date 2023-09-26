import Foundation

public class GraphNode<T: Comparable>: Equatable, Comparable {

    let id: UUID = UUID()
    public var value: T
    public var next: [GraphNode]
    public var parent: GraphNode?

    public init(_ value: T, next: [GraphNode] = [], parent: GraphNode? = nil) {
        self.value = value
        self.next = next
        self.parent = parent
    }

    public static func ==(lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs.id == rhs.id
    }

    public func show() {
        print(
        """
        id     = \(id)
        value  = \(value)
        next   = \(String(describing: next))
        parent = \(String(describing: parent?.id))
        """
        )
    }

    public static func < (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.value > rhs.value
    }
}

