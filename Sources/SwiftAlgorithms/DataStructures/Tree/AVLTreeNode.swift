import Foundation

public class AVLTreeNode<T: Equatable>: Equatable {

    private let id = UUID()
    public var value: T
    public var leftChild: AVLTreeNode?
    public var rightChild: AVLTreeNode?
    public var level: Int = 0
    public weak var parent: AVLTreeNode?

    public init(value: T) {
        self.value = value
    }

    var isLeaf: Bool {
        return rightChild == nil && leftChild == nil
    }

    var isLeftNode: Bool {
        return parent?.leftChild == self
    }

    var isRightNode: Bool {
        return parent?.rightChild == self
    }

    var isRoot: Bool {
        return parent == nil
    }

    public func addLeft(_ node: AVLTreeNode) {
        node.parent = self
        node.level = level + 1
        leftChild = node
    }

    public func addRight(_ node: AVLTreeNode) {
        node.parent = self
        node.level = level + 1
        rightChild = node
    }

    public func traverseInOrder(_ callback: (AVLTreeNode) -> Void) {
        leftChild?.traverseInOrder(callback)
        callback(self)
        rightChild?.traverseInOrder(callback)
    }


    public func traversePreOrder(_ callback: (AVLTreeNode) -> Void) {
        callback(self)
        leftChild?.traversePreOrder(callback)
        rightChild?.traversePreOrder(callback)
    }

    public func traversePostOrder(_ callback: (AVLTreeNode) -> Void) {
        leftChild?.traversePostOrder(callback)
        rightChild?.traversePostOrder(callback)
        callback(self)
    }

    public func mostLeftNode() -> AVLTreeNode<T>? {
        var mostLeft: AVLTreeNode? = nil

        traversePreOrder {

            if $0.isLeftNode {

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

    public static func == (lhs: AVLTreeNode<T>, rhs: AVLTreeNode<T>) -> Bool {
        lhs.id == rhs.id
    }
}
