/*:

 # Contacts

 We're going to make our own Contacts application! The application must perform two types of operations:

 - `add name`, where `name` is a string denoting a contact name. This must store `name` as a new contact in the application.
 - `find partial`, where `partial` is a string denoting a partial name to search the application for. It must count the number of contacts starting with `partial and print the count on a new line.

 Given `n` sequential add and find operations, perform each operation in order.

 **Input Format**

 The first line contains a single integer, `n`, denoting the number of operations to perform.
 Each line `i` of the `n` subsequent lines contains an operation in one of the two forms defined above.

 **Constraints**

 - `1 <= n <= 10^5`
 - `1 <= |name| <= 21`
 - `1 <= |partial| <= 21`
 - It is guaranteed that `name` and `partial` contain lowercase English letters only.

 **Output Format**

 For each `find partial` operation, print the number of contact names starting with `partial` on a new line.

 **Sample Input**

 ```
 4
 add hack
 add hackerrank
 find hac
 find hak
 ```

 **Sample Output**

 ```
 2
 0
 ```

 **Explanation**

 We perform the following sequence of operations:

 - Add a contact named `hack`.
 - Add a contact named `hackerrank`.
 - Find and print the number of contact names beginning with `hac`. There are currently two contact names in the application and both of them start with `hac`, so we print `2` on a new line.
 - Find and print the number of contact names beginning with `hak`. There are currently two contact names in the application but neither of them start with `hak`, so we print `0` on a new line.

 **Source:** [Hackerrank - Contacts](https://www.hackerrank.com/challenges/contacts)
 */

import Foundation


// MARK: stdin

func readData() -> NSData {
    return NSFileHandle.fileHandleWithStandardInput().availableData
}

func readString() -> String {
    return String(data: readData(), encoding:NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func readArrayOfStrings() -> Array<String> {
    return readString().componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

// MARK: Trie

class Trie {
    var children: [Character:Trie] = [:]
    var number = 0
}

extension Trie {
    func insert(word word: String) {
        var node = self

        for character in word.characters {
            if node.children[character] == nil {
                node.children[character] = Trie()
            }

            node.number += 1

            node = node.children[character]!
        }

        node.number += 1
    }

    func find(occurencesOfWord word: String) -> Int {
        var node = self

        for character in word.characters {
            guard let children = node.children[character] else {
                return 0
            }

            node = children
        }

        return node.number
    }
}

let AddPrefix = "add"
let FindPrefix = "find"
let input = ["4", "add hack", "add hackerrank", "find hac", "find hak"] //readArrayOfStrings()
let operationsArray = Array(input[1..<input.count])
let trie = Trie()

for operation in operationsArray {
    let operationComponents = operation.componentsSeparatedByString(" ")

    switch operationComponents.first! {
    case AddPrefix:

        trie.insert(word: operationComponents.last!)
    case FindPrefix:
        print(trie.find(occurencesOfWord: operationComponents.last!))
        
    default:
        print("Not supported")
    }
}