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

    public func push(_ value: T) {
        let node = Node(value)
        push(node)
    }

    public func append(_ value: T) {
        let node = Node(value)

        guard let tail = tail else {
            setOneNode(node)
            return
        }

        let old = tail
        self.tail = node
        node.parent = old
        old.next = node
    }

    public func middle() -> Node<T>? {
        var slow = head
        var fast = head

        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }

        return slow
    }

    public func merge(_ list: LinkedList<T>) {

        // nothing to merge
        if list.head == nil {
            return
        }

        // merge new list
        if head == nil {
            head = list.head
            tail = list.tail
            return
        }

        var index = [Node<T>]()

        var current = head
        while current != nil {
            index.append(current!)
            current = current?.next
        }

        current = list.head
        while current != nil {
            index.append(current!)
            current = current?.next
        }
        
        var sorted = index.sorted { (m1, m2) -> Bool in
            return m1 > m2
        }

        let first = sorted.removeFirst()
        first.parent = nil
        first.next = nil

        head = first
        current = sorted.removeFirst()
        current?.parent = head
        current?.next = nil
    }

    public func insert(_ value: T, after: Node<T>) {
        let node = Node(value)

        var current = self.head

        if after == tail {
            self.append(value)
            return
        }

        while current != tail && current != nil {
            if current == after {
                node.parent = current
                node.next = current?.next
                current?.next?.parent = node
                current?.next = node
                return
            }

            current = current?.next
        }

        print("Could not find node => \(after.id)")
    }

    public func reversed() {

        var current = self.tail
        var prev: Node<T>? = nil
        self.head = current

        while current != nil {
            current?.next = current?.parent
            current?.parent = prev
            prev = current
            current = current?.next
        }

        self.tail = prev
    }

    @discardableResult
    public func removeAllOccurrences(_ value: T) -> Int {
        var removed = 0
        var current = head
        while current != nil {
            let next = current?.next
            let target = current

            if target?.value == value {
                remove(target!)
                removed += 1
            }

            current = next
        }

        return removed
    }

    @discardableResult
    public func pop() -> Node<T>? {
        let old = self.head
        let next = self.head?.next

        if self.head == self.tail {
            self.head = nil
            self.tail = nil
            return old
        }

        self.head = next
        next?.parent = nil
        return old
    }

    @discardableResult
    public func removeFirst() -> Node<T>? {
        if head == nil {
            return nil
        }

        let oldHead = head
        let newHead = head?.next
        newHead?.parent = nil
        head = newHead
        return oldHead
    }

    @discardableResult
    public func removeLast() -> Node<T>? {
        let old = self.tail

        if self.head == self.tail {
            self.head = nil
            self.tail = nil
            return old
        }

        self.tail = self.tail?.parent
        self.tail?.next = nil
        old?.parent = nil

        return old
    }

    @discardableResult
    public func removeAt(_ index: Int) -> Node<T>? {
        var current = self.head
        var counter = 0

        if index < 0 {
            return nil
        }

        while current != nil {
            if index == counter {
                remove(current!)
                return current
            }
            current = current?.next
            counter += 1
        }

        return nil
    }

    @discardableResult
    public func removeWhere(_ value: T) -> Node<T>? where T: Equatable {
        guard let node = find(value: value) else {
            return nil
        }

        remove(node)
        return node
    }

    public func remove(_ node: Node<T>) {
        if node == self.head {
            head = node.next
            node.next?.parent = nil
        }

        if node == self.tail {
            tail = tail?.parent
        }

        node.parent?.next = node.next
        node.next?.parent = node.parent
        node.parent = nil
        node.next = nil
    }

    public func find(value: T) -> Node<T>? where T: Equatable {
        var current = head

        if self.head?.value == value {
            return head
        } else if self.tail?.value == value {
            return tail
        }

        while current != tail && current != nil {
            if current?.value == value {
                return current
            }

            current = current?.next
        }

        return nil
    }

    public func show() {
        var current = self.head
        while current != nil {
            current?.show()
            print("==========")
            current = current?.next
        }
    }

    private func push(_ node: Node<T>) {
        guard let head = head else {
            setOneNode(node)
            return
        }

        let old = head
        self.head = node
        node.next = old
        old.parent = node
    }

    private func setOneNode(_ node: Node<T>) {
        self.tail = node
        self.head = node
    }
}

