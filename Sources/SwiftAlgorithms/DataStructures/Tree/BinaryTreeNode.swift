import Foundation

public class BinaryTreeNode<T: Equatable>: Equatable {

    private let id = UUID()
    public var value: T
    public var leftChild: BinaryTreeNode?
    public var rightChild: BinaryTreeNode?
    public var level: Int = 0
    public weak var parent: BinaryTreeNode?

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

    public func addLeft(_ node: BinaryTreeNode) {
        node.parent = self
        node.level = level + 1
        leftChild = node
    }

    public func addRight(_ node: BinaryTreeNode) {
        node.parent = self
        node.level = level + 1
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

    public static func == (lhs: BinaryTreeNode<T>, rhs: BinaryTreeNode<T>) -> Bool {
        lhs.id == rhs.id
    }
}

extension BinaryTreeNode: CustomStringConvertible {

    public var description: String {
        diagram(for: self)
    }

    private func diagram(for node: BinaryTreeNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌──", top + "│ ")
        + root + "\(node.value)\n"
        + diagram(for: node.leftChild,
                  bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
