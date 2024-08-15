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
    public func removeFirst() -> Node<T>? {
        guard let currentHead = head else {
            return nil
        }

        guard let next = currentHead.next else {
            head = nil
            tail = nil
            return currentHead
        }

        head = next
        return currentHead
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

                if next.value >= right!.value {
                    let nextRight = right?.next
                    right?.next = left?.next
                    left?.next = right

                    left = left?.next
                    right = nextRight
                    if nextRight == nil { break }
                    continue
                } else {
                    left = left?.next
                    continue
                }

            } else {
                let nextRight = right?.next
                let currentRight = right

                currentRight?.next = left
                if head === left {
                    head = currentRight
                }
                left = currentRight
                right = nextRight
                if left == nil { break }
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

    static func mergeSorted(left: LinkedList, right: LinkedList) -> LinkedList {
        guard !left.isEmpty else {
            return right
        }

        guard !right.isEmpty else {
            return left
        }

        var newHead: Node<T>?

        // 1
        var tail: Node<T>?
        var currentLeft = left.head
        var currentRight = right.head
        // 2
        if let leftNode = currentLeft, let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                newHead = leftNode
                currentLeft = leftNode.next
            } else {
                newHead = rightNode
                currentRight = rightNode.next
            }
            tail = newHead
        }

        // 1
        while let leftNode = currentLeft, let rightNode = currentRight {
            // 2
            if leftNode.value < rightNode.value {
                tail?.next = leftNode
                currentLeft = leftNode.next
            } else {
                tail?.next = rightNode
                currentRight = rightNode.next
            }
            tail = tail?.next
        }

        if let leftNodes = currentLeft {
            tail?.next = leftNodes
        }

        if let rightNodes = currentRight {
            tail?.next = rightNodes
        }

        let list = LinkedList<T>()
        list.head = newHead
        list.tail = {
            while let next = tail?.next {
                tail = next
            }
            return tail
        }()
        return list

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
