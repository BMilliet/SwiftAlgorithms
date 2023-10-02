
public struct BinarySearchTree<T: Comparable> {

    public var root: BinaryTreeNode<T>?

    public init() {}


    public mutating func insert(_ v: T) {
        root = _insert(from: root, v)
    }


    private func _insert(from node: BinaryTreeNode<T>?, _ v: T) -> BinaryTreeNode<T> {

        guard let node = node else {
            return BinaryTreeNode(value: v)
        }

        if v < node.value {
            node.leftChild = _insert(from: node.leftChild, v)
        } else {
            node.rightChild = _insert(from: node.rightChild, v)
        }

        return node
    }


    public func contains(_ value: T) -> Bool {

        var current = root

        while current != nil {

            if current?.value == value {
                return true
            }

            if current!.value < value {
                current = current?.rightChild
            } else {
                current = current?.leftChild
            }
        }

        return false
    }


    /*
    works but its not the best performance

    public func contains(_ value: T) -> Bool {
        guard let root = root else { return false }

        var found = false
        root.traverseInOrder {
            if $0.value == value {
                found = true
            }
        }

        return found
    }
    */
}
