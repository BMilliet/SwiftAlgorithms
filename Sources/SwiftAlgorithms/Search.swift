public enum Search {
    public static func binary<T: Comparable>(_ arr: [T], target: T) -> Int? {
        var min = 0
        var max = arr.count - 1

        while min <= max {
            let index = (min + max) / 2
            let middle = arr[index]

            if middle == target {
                return index
            }

            if middle < target {
                min = index + 1
            } else {
                max = index - 1
            }
        }

        return nil
    }
}
