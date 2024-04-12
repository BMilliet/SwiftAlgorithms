import Foundation

public class DoublyNode<T: Comparable>: Equatable, Comparable {

    let id: UUID = UUID()
    public var value: T
    public var next: DoublyNode?
    public var parent: DoublyNode?

    public init(_ value: T, next: DoublyNode? = nil, parent: DoublyNode? = nil) {
        self.value = value
        self.next = next
        self.parent = parent
    }

    public static func ==(lhs: DoublyNode, rhs: DoublyNode) -> Bool {
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

    public static func < (lhs: DoublyNode<T>, rhs: DoublyNode<T>) -> Bool {
        return lhs.value > rhs.value
    }
}

