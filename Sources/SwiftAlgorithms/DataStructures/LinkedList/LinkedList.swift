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

    public func middle() -> Node<T>? {
        var fast = head
        var slow = head

        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }

        return slow
    }

    public func reverse() {
        if head?.next === tail {
            let oldHead = head
            oldHead?.next = nil
            head = tail
            head?.next = oldHead
            tail = oldHead
            return
        }

        var mark = tail
        var current = head

        while mark !== head || current == nil {

            if current?.next === mark {
                // found mark revert reference
                mark?.next = current
                current?.next = nil
                mark = current
                // reset
                current = head
                continue
            }

            current = current?.next
        }

        let oldHead = head
        head = tail
        tail = oldHead
    }

    public func removeAllOccurrences(of v: T) {
        while head?.value == v {
            pop()
        }

        var cur = head

        while cur != nil {
            if cur?.value == v {
                if cur === tail {
                    removeLast()
                    break
                } else {
                    cur?.next = cur?.next?.next
                }
            }
            cur = cur?.next
        }
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

extension LinkedList: Collection {

    public var startIndex: Index {
        Index(node: head)
    }

    public var endIndex: Index {
        Index(node: tail?.next)
    }

    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }

    public subscript(position: Index) -> T {
        position.node!.value
    }

    public struct Index: Comparable {

        public var node: Node<T>?

        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }

        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
}
