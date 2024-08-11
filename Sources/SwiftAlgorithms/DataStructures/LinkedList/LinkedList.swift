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
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil

        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
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

    public func values() -> [T] {
        var arr = [T]()

        var current = head

        while current != nil {
            if let v = current?.value {
                arr.append(v)
            }
            current = current?.next
        }

        return arr
    }

    public func mergeSorted(_ secondList: LinkedList) {

        guard !isEmpty else {
            return
        }

        guard !secondList.isEmpty else {
            return
        }

        var left = head
        var right = secondList.head

        while left != nil || right != nil {

            if left!.value <= right!.value {
                
                guard let next = left?.next else {
                    left?.next = right
                    break
                }

                if next.value > right!.value {
                    let nextRight = right?.next
                    right?.next = left?.next
                    left?.next = right

                    // loop both
                    left = left?.next
                    right = nextRight
                    if nextRight == nil { break }
                    continue
                } else {
                    // loop left only
                    left = left?.next
                    continue
                }

            } else {
                left = left?.next
            }
        }

        adjustTail()
    }

    private func adjustTail() {
        var current = head

        while current != nil {
            tail = current
            current = current?.next
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
