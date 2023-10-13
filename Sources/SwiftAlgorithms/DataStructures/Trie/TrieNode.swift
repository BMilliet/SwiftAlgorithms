public class TrieNode<T: Hashable> {

    public var value: T?

    public weak var parent: TrieNode?

    public var children: [T: TrieNode] = [:]

    public var isTerminating = false

    init(value: T?, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
}
