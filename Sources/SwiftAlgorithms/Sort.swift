public enum Sort {
    public static func quick<T: Comparable>(_ arr: [T]) -> [T] {
        if arr.isEmpty {
            return []
        }

        var newArr  = arr
        let middle  = arr.count/2
        let pivot   = arr[middle]
        var smaller = [T]()
        var greater = [T]()

        newArr.remove(at: middle)

        newArr.forEach {
            if $0 > pivot {
                greater.append($0)
            } else {
                smaller.append($0)
            }
        }

        return quick(smaller) + [pivot] + quick(greater)
    }

    public static func quickReversed<T: Comparable>(_ arr: [T]) -> [T] {
        if arr.isEmpty {
            return []
        }

        var newArr  = arr
        let middle  = arr.count/2
        let pivot   = arr[middle]
        var smaller = [T]()
        var greater = [T]()

        newArr.remove(at: middle)

        newArr.forEach {
            if $0 > pivot {
                greater.append($0)
            } else {
                smaller.append($0)
            }
        }

        return quickReversed(greater) + [pivot] + quickReversed(smaller)
    }
}
