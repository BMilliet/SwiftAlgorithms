public enum BinaryTreeNodeSide {
    case left, right
}

public class BinaryTreeNode<T: Equatable> {

    public var value: T
    public var leftChild: BinaryTreeNode?
    public var rightChild: BinaryTreeNode?
    public var level: Int = 0
    public var side: BinaryTreeNodeSide? = nil
    public weak var parent: BinaryTreeNode?

    public init(value: T) {
        self.value = value
    }

    public func addLeft(_ node: BinaryTreeNode) {
        node.parent = self
        node.level = level + 1
        node.side = .left
        leftChild = node
    }

    public func addRight(_ node: BinaryTreeNode) {
        node.parent = self
        node.level = level + 1
        node.side = .right
        rightChild = node
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

    public func mostLeftNode() -> BinaryTreeNode<T>? {
        var mostLeft: BinaryTreeNode? = nil

        traversePreOrder {
            if $0.side == .left {

                guard let previousMostLeft = mostLeft else {
                    mostLeft = $0
                    return
                }

                if $0.level > previousMostLeft.level {
                    mostLeft = $0
                }
            }
        }

        return mostLeft
    }

    public func toArr() -> [T] {
        var arr = [T]()
        self.traversePreOrder { arr.append($0.value) }
        return arr
    }
}
