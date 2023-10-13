public class Trie<T: Collection> where T.Element: Hashable {

    public typealias Node = TrieNode<T.Element>

    private let root = Node(value: nil, parent: nil)

    public init() {}

    public func insert(_ collection: T) {
        // 1
        var current = root

        // 2
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(value: element, parent: current)
            }
            current = current.children[element]!
        }

        // 3
        current.isTerminating = true
    }

    public func contains(_ collection: T) -> Bool {
        var current = root

        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }

        return current.isTerminating
    }

    public func remove(_ collection: T) {
        // 1

        // find the last node
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        guard current.isTerminating else {
            return
        }
        // 2
        current.isTerminating = false
        
        // 3
        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {

            parent.children[current.value!] = nil
            current = parent
        }
    }
}

public extension Trie where T: RangeReplaceableCollection {

    func collections(startingWith prefix: T) -> [T] {
        // 1
        var current = root


        // find leaf
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }

        // pass the first and the last node
        return collections(startingWith: prefix, after: current)
    }

    private func collections(startingWith prefix: T,
                             after node: Node) -> [T] {

        var results: [T] = []

        // if current node (prefix) is the last, append
        if node.isTerminating {
            results.append(prefix)
        }

        // 2
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.value!)
            results.append(contentsOf: collections(startingWith: prefix,
                                                   after: child))
        }

        return results
    }
}

