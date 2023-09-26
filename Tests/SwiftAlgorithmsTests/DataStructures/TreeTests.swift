import XCTest
@testable import SwiftAlgorithms

final class TreeTests: XCTestCase {

    func test_depth_first_traversal() throws {

        var names = [String]()
        let tree = makeBeverageTree()

        tree.forEachDepthFirst { names.append($0.value) }

        let expected = [
            "Beverages",
            "hot",
            "tea",
            "black",
            "green",
            "chai",
            "coffee",
            "cocoa",
            "cold",
            "soda",
            "ginger ale",
            "bitter lemon",
            "milk"
        ]

        XCTAssertEqual(expected, names)
    }

    func test_level_order_traversal() throws {

        var names = [String]()
        let tree = makeBeverageTree()

        tree.forEachLevelOrder { names.append($0.value) }

        let expected = [
            "Beverages",
            "hot",
            "cold",
            "tea",
            "coffee",
            "cocoa",
            "soda",
            "milk",
            "black",
            "green",
            "chai",
            "ginger ale",
            "bitter lemon",
        ]

        XCTAssertEqual(expected, names)
    }

    func test_search() throws {

        let tree = makeBeverageTree()

        XCTAssertEqual("green", tree.search("green")?.value)
        XCTAssertNil(tree.search("123"))
    }

    func test_print_tree() throws {

        let tree = makeBeverageTree()
        var str = ""

        var lastLvl = 0

        tree.forEachLevelOrder {
            if $0.level > lastLvl {
                lastLvl = $0.level
                str.append("\n")
            }
            str.append("\($0.value) ")
        }

        let expected = "Beverages \nhot cold \ntea coffee cocoa soda milk \nblack green chai ginger ale bitter lemon "

        XCTAssertEqual(expected, str)
    }

    // Factory

    private func makeBeverageTree() -> TreeNode<String> {
        let tree = TreeNode("Beverages")

        let hot = TreeNode("hot")
        let cold = TreeNode("cold")

        let tea = TreeNode("tea")
        let coffee = TreeNode("coffee")
        let chocolate = TreeNode("cocoa")

        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")

        let soda = TreeNode("soda")
        let milk = TreeNode("milk")

        let gingerAle = TreeNode("ginger ale")
        let bitterLemon = TreeNode("bitter lemon")

        tree.add(hot)
        tree.add(cold)

        hot.add(tea)
        hot.add(coffee)
        hot.add(chocolate)

        cold.add(soda)
        cold.add(milk)

        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)

        soda.add(gingerAle)
        soda.add(bitterLemon)

        return tree
    }
}
