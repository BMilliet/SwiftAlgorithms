public struct Stack<T> {
    private var store: [T] = []

    public init(_ arr: [T] = []) {
        store = arr
    }

    public var isEmpty: Bool {
        peek() == nil
    }

    public mutating func push(_ value: T) {
        store.append(value)
    }

    @discardableResult
    public mutating func pop() -> T {
        return store.removeLast()
    }

    @discardableResult
    public func peek() -> T? {
        return store.last
    }

    public func show() {
        print(
        """
        --- top ---
        \(store.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
        )
    }
}

