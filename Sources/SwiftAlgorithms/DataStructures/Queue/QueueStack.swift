public struct QueueStack<T>: Queue {

    private var leftStack = [T]()
    private var rightStack = [T]()

    public var isEmpty: Bool {
        rightStack.isEmpty && leftStack.isEmpty
    }

    public var peek: T? {
        rightStack.isEmpty ?
        leftStack.last :
        rightStack.first
    }

    @discardableResult
    public mutating func enqueue(_ e: T) -> Bool {
        rightStack.append(e)
        return true
    }

    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }

        let removed = leftStack.removeLast()
        return removed
    }

    public mutating func reverse() {
        leftStack = leftStack.reversed()
        rightStack = rightStack.reversed()
    }
}
