import Foundation

public class Node<T: Comparable>: Equatable, Comparable {

    let id: UUID = UUID()
    public var value: T
    public var next: Node?
    public var parent: Node?

    public init(_ value: T, next: Node? = nil, parent: Node? = nil) {
        self.value = value
        self.next = next
        self.parent = parent
    }

    public static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }

    public func show() {
        print(
        """
        id     = \(id)
        value  = \(value)
        next   = \(String(describing: next?.id))
        parent = \(String(describing: parent?.id))
        """
        )
    }

    public static func < (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value > rhs.value
    }
}

