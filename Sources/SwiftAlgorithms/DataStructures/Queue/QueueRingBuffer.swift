public struct QueueRingBuffer<T>: Queue {

    private var buffer: RingBuffer<T>

    public var isEmpty: Bool {
        buffer.isEmpty
    }

    public var peek: T? {
        buffer.peek
    }

    init(size: Int) {
        self.buffer = RingBuffer<T>(size)
    }

    @discardableResult
    public mutating func enqueue(_ e: T) -> Bool {
        buffer.write(e)
        return true
    }

    public mutating func dequeue() -> T? {
        return buffer.read()
    }

    public mutating func reverse() {
        buffer.reversed()
    }
}
