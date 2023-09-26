import Foundation

public struct Graph<T: Comparable> {

    public let root: GraphNode<T>?

    public func search(_ node: GraphNode<T>) -> GraphNode<T>? {
        var checked = [UUID: Bool]()
        var list = [root]

        while !list.isEmpty {
            guard let first = list.removeFirst() else { continue }
            checked[first.id] = true

            if first == node {
                return first
            }

            first.next.forEach {
                if checked[$0.id] == nil {
                    list.append($0)
                }
            }
        }

        return nil
    }

    public func search(_ value: T) -> GraphNode<T>? {
        var checked = [UUID: Bool]()
        var list = [root]

        while !list.isEmpty {
            guard let first = list.removeFirst() else { continue }
            checked[first.id] = true

            if first.value == value {
                return first
            }

            first.next.forEach {
                if checked[$0.id] == nil {
                    list.append($0)
                }
            }
        }

        return nil
    }
}
