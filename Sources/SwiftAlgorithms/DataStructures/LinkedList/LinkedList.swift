public class LinkedList<T: Comparable> {
    public var head: Node<T>?
    public var tail: Node<T>?

    public init() {
    }

    public var isEmpty: Bool {
        head == nil
    }

    public var headValue: T? {
        head?.value
    }

    public var tailValue: T? {
        tail?.value
    }

    public func push(_ v: T) {
        head = Node(value: v, next: head)
        if tail == nil {
            tail = head
        }
    }

    public func append(_ v: T) {
        if isEmpty {
            push(v)
            return
        }

        tail?.next = Node(value: v)
        tail = tail?.next
    }

    @discardableResult
    public func pop() -> Node<T>? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head
    }

    @discardableResult
    public func removeLast() -> Node<T>? {
        var cur = head

        if head === tail {
            return pop()
        }

        while cur?.next?.next != nil {
            cur = cur?.next
        }

        defer {
            cur?.next = nil
            tail = cur
        }

        return cur?.next
    }

    @discardableResult
    public func remove(after node: Node<T>) -> Node<T>? {
        if node.next === tail {
            return removeLast()
        }

        defer {
            node.next = node.next?.next
        }

        return node.next
    }

    @discardableResult
    public func insert(v: T, after node: Node<T>) -> Node<T>? {
        if node === tail {
            append(v)
            return tail
        }
        let next = node.next
        node.next = Node(value: v, next: next)
        return node.next
    }

    public func node(i: Int) -> Node<T>? {
        var index = 0
        var cur = head

        while cur != nil {
            if i == index {
                return cur
            }
            index += 1
            cur = cur?.next
        }
        return nil
    }
}


extension LinkedList: CustomStringConvertible {

    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
