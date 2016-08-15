/*:
 
 # Binary Numbers
 
 **Objective**

 Today, we're working with binary numbers. Check out the [Tutorial](https://www.hackerrank.com/challenges/30-binary-numbers/tutorial) tab for learning materials and an instructional video!

 **Task**

 Given a base-`10` integer, `n`, convert it to binary (base-`2`). Then find and print the base-`10` integer denoting the maximum number of consecutive `1`'s in `n`'s binary representation.

 **Input Format**

 A single integer, `n`.

 **Constraints**

 - `1 <= n <= 10^6`

 **Output Format**

 Print a single base-`10` integer denoting the maximum number of consecutive `1`1's in the binary representation of `n`.

 **Sample Input 1**

 ```
 5
 ```

 **Sample Output 1**

 ```
 1
 ```

 **Sample Input 2**

 ```
 13
 ```

 **Sample Output 2**

 ```
 2
 ```

 **Explanation**

 Sample Case 1:
 - The binary representation of `5` is `101`, so the maximum number of consecutive `1`'s is `1`.

 Sample Case 2:
 - The binary representation of `13` is `1101`, so the maximum number of consecutive `1`'s is `2`.
 
 **Source:** [Hackerrank - Binary Numbers](https://www.hackerrank.com/challenges/30-binary-numbers)
 */

import Foundation

final class Stack {
    private var array: [Int] = []

    func push(value: Int) {
        array.append(value)
    }

    func pop() -> Int? {
        return array.popLast()
    }

    func isEmpty() -> Bool {
        return array.count == 0
    }
}

// MARK: stdin

func readData() -> NSData {
    return NSFileHandle.fileHandleWithStandardInput().availableData
}

func readString() -> String {
    return String(data: readData(), encoding:NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func readInt() -> Int {
    return Int(readString())!
}

var number = 13 //readInt()
let stack = Stack()

repeat {
    stack.push(number & 1)

    number = (number >> 1)
} while (number > 0)

var maximumNumberOfOnes = 0
var currentMaximumNumberOfOnes = 0
while !stack.isEmpty() {
    let value = stack.pop()

    if value == 1 {
        currentMaximumNumberOfOnes += 1

        if currentMaximumNumberOfOnes > maximumNumberOfOnes {
            maximumNumberOfOnes = currentMaximumNumberOfOnes
        }
    } else {
        currentMaximumNumberOfOnes = 0
    }
}

print(maximumNumberOfOnes)
