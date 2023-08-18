public class QueueLinkedList<T: Comparable>: Queue {

    public var isEmpty: Bool {
        list.isEmpty
    }

    public var peek: T? {
        list.head?.value
    }

    private var list = LinkedList<T>()

    public init() {}

    @discardableResult
    public func enqueue(_ e: T) -> Bool {
        list.append(e)
        return true
    }

    @discardableResult
    public func dequeue() -> T? {
        let removed = list.removeFirst()
        return removed?.value
    }

    public func reverse() {
        list.reversed()
    }
}
