public struct AVLTree<T: Comparable> {

    public var root: AVLTreeNode<T>?

    public init() {}


    public mutating func insert(_ v: T, balanced: Bool = true) {
        root = _insert(from: root, v)
        if balanced { balance() }
    }


    private func _insert(from node: AVLTreeNode<T>?, _ v: T) -> AVLTreeNode<T> {

        guard let node = node else {
            return AVLTreeNode(value: v)
        }

        if v < node.value {
            node.leftChild = _insert(from: node.leftChild, v)
        } else {
            node.rightChild = _insert(from: node.rightChild, v)
        }

        return node
    }


    public var height: Int {
        root?.getHeight() ?? 0
    }


    public var isBalanced: Bool {
        root?.isBalanced ?? true
    }

    public func contains(_ value: T) -> Bool {
        return find(value) != nil
    }


    public func find(_ value: T) -> AVLTreeNode<T>? {

        var current = root

        while current != nil {

            if current?.value == value {
                return current
            }

            if current!.value < value {
                current = current?.rightChild
            } else {
                current = current?.leftChild
            }
        }

        return nil
    }


    public func remove(_ value: T) {
        guard let target = find(value) else { return }

        // is leaf
        if target.isLeaf {
            swap(target, newNode: nil)
            return
        }

        if target.leftChild != nil && target.rightChild != nil {
            guard let mostLeft = target.mostLeftNode() else {
                return
            }
            swap(target, newNode: mostLeft)
        }

        if target.leftChild == nil {
            swap(target, newNode: target.rightChild)
            return
        } else if target.rightChild == nil {
            swap(target, newNode: target.leftChild)
            return
        }
    }


    private func swap(_ oldNode: AVLTreeNode<T>, newNode: AVLTreeNode<T>?) {
        newNode?.level = oldNode.level

        if oldNode.isLeftNode {
            oldNode.parent?.leftChild = newNode
        } else {
            oldNode.parent?.rightChild = newNode
        }
    }

    public func display() {
        print(root ?? "")
    }

    mutating func balance() {
        // left heavy
        if root?.leftChild?.getHeight() ?? 0 > root?.rightChild?.getHeight() ?? 0 {
            root = rightRotation(root)

        // right heavy
        } else {
            root = leftRotation(root)
        }
    }

    mutating func balanceAll() {
        while !root!.isBalanced {
            balance()
        }
    }

    public func rightRotation(_ node: AVLTreeNode<T>?) -> AVLTreeNode<T>? {
        guard let node = node else { return nil }

        guard let pivot = node.leftChild else { return node }

        if pivot.isLeaf {
            node.leftChild = nil
            pivot.rightChild = node
            return pivot
        }

        var newPivot: AVLTreeNode<T>? = pivot

        if newPivot?.leftChild == nil {
            newPivot = leftRotation(newPivot)
        }

        node.leftChild = nil
        newPivot?.rightChild = node

        return newPivot
    }

    public func leftRotation(_ node: AVLTreeNode<T>?) -> AVLTreeNode<T>? {
        guard let node = node else { return nil }

        guard let pivot = node.rightChild else { return node }

        if pivot.isLeaf {
            node.rightChild = nil
            pivot.leftChild = node
            return pivot
        }

        var newPivot: AVLTreeNode<T>? = pivot

        if newPivot?.rightChild == nil {
            newPivot = rightRotation(newPivot)
        }

        node.rightChild = nil
        newPivot?.leftChild = node

        return newPivot
    }
}
