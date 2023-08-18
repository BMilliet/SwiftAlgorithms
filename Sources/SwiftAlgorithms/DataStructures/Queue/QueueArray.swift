public struct QueueArray<T>: Queue {

    private var arr = [T]()

    public var isEmpty: Bool {
        return arr.isEmpty
    }

    public var peek: T? {
        return arr.first
    }

    @discardableResult
    public mutating func enqueue(_ e: T) -> Bool {
        arr.append(e)
        return true
    }

    @discardableResult
    public mutating func dequeue() -> T? {
        isEmpty ? nil : arr.removeFirst()
    }

    public mutating func reverse() {
        arr = arr.reversed()
    }
}
