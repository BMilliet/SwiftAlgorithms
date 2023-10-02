public class BinaryTreeNode<T: Equatable> {

    public var value: T
    public var leftChild: BinaryTreeNode?
    public var rightChild: BinaryTreeNode?

    public init(value: T) {
        self.value = value
    }

    public func traverseInOrder(_ callback: (BinaryTreeNode) -> Void) {
        leftChild?.traverseInOrder(callback)
        callback(self)
        rightChild?.traverseInOrder(callback)
    }


    public func traversePreOrder(_ callback: (BinaryTreeNode) -> Void) {
        callback(self)
        leftChild?.traversePreOrder(callback)
        rightChild?.traversePreOrder(callback)
    }

    public func traversePostOrder(_ callback: (BinaryTreeNode) -> Void) {
        leftChild?.traversePostOrder(callback)
        rightChild?.traversePostOrder(callback)
        callback(self)
    }

    public func toArr() -> [T] {
        var arr = [T]()
        self.traversePreOrder { arr.append($0.value) }
        return arr
    }

    public func search(_ value: T) -> BinaryTreeNode? {
        return nil
    }
}
