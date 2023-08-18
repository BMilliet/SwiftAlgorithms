public struct RingBuffer<T> {
    
    private var arr: [T?]
    private var readIndex  = 0
    private var writeIndex = 0

    public var peek: T? {
        arr[readIndex]
    }

    public var isFull: Bool {
        writeIndex >= arr.count
    }

    public var isEmpty: Bool {
        writeIndex == 0
    }

    public init(_ size: Int) {
        self.arr = [T?](repeating: nil, count: size)
    }

    @discardableResult
    public mutating func write(_ e: T) -> Bool {
        arr[writeIndex % arr.count] = e
        writeIndex += 1
        return true
    }

    public mutating func read() -> T? {
        if readIndex >= writeIndex {
            return nil
        }

        defer { readIndex += 1 }
        return arr[readIndex % arr.count]
    }

    public mutating func reversed() {
        readIndex = arr.count - readIndex
        writeIndex = arr.count - writeIndex
        arr = arr.reversed()
    }
}
