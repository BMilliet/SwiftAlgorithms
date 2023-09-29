public class TreeNode<T: Equatable> {
    public var value: T
    public var children: [TreeNode] = []
    public weak var parent: TreeNode? = nil
    public var level: Int = 0

    public init(_ value: T) {
        self.value = value
    }

    public func add(_ child: TreeNode) {
        child.level = level + 1
        child.parent = self
        children.append(child)
    }

    public func forEachDepthFirst(_ callback: (TreeNode) -> Void) {
        callback(self)
        children.forEach { $0.forEachDepthFirst(callback) }
    }

    public func forEachLevelOrder(_ callback: (TreeNode) -> Void) {
        callback(self)

        var queue = QueueArray<TreeNode>()

        children.forEach { queue.enqueue($0) }

        while let node = queue.dequeue() {
            callback(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }

    public func search(_ value: T) -> TreeNode? {
        var node: TreeNode? = nil

        forEachLevelOrder {
            if $0.value == value {
                node = $0
            }
        }
        return node
    }

    /*
    public func forEachLevelOrder(_ callback: (TreeNode) -> Void) {
        var nodes = [TreeNode]()
        self.forEachDepthFirst { nodes.append($0) }
        nodes.sort { $0.level < $1.level }
        nodes.forEach { callback($0) }
    }
     */
}
