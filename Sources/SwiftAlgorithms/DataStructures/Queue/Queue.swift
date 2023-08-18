public protocol Queue {
    associatedtype T
    mutating func enqueue(_ e: T) -> Bool
    mutating func dequeue() -> T?
    mutating func reverse()
    var isEmpty: Bool { get }
    var peek: T? { get }
}

