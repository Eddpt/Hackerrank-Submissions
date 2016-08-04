/*:

 # Sherlock and Array

 Watson gives Sherlock an array `A` of length `N`. Then he asks him to determine if there exists an element in the array such that the sum of the elements on its left is equal to the sum of the elements on its right. If there are no elements to the left/right, then the sum is considered to be zero.
 Formally, find an `i`, such that, `A(1) + A(2) ... A(i-1) = A(i+1) + A(i+2) ... A(n)`.

 **Input Format**

 The first line contains `T`, the number of test cases. For each test case, the first line contains `N`, the number of elements in the array `A`. The second line for each test case contains `N` space-separated integers, denoting the array `A`.

 **Output Format**

 For each test case print `YES` if there exists an element in the array, such that the sum of the elements on its left is equal to the sum of the elements on its right; otherwise print `NO`.

 **Constraints**

 - `1 <= T <= 10`
 - `1 <= N <= 10^5`
 - `1 <= Ai <= 2 * 10^4`
 - `1 <= i <= N`

 **Sample Input**

 ```
 2
 3
 1 2 3
 4
 1 2 3 3
 ```

 **Sample Output**

 ```
 NO
 YES
 ```

 **Explanation**

 For the first test case, no such index exists.
 For the second test case, `A[1] + A[2] = A[4]`, therefore index `3` satisfies the given conditions.
 
 **Source:** [Hackerrank - Sherlock And Array](https://www.hackerrank.com/challenges/sherlock-and-array)
 */

import Foundation

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

func readArrayOfStrings() -> Array<String> {
    return readString().componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func readArrayOfInts() -> Array<Int> {
    return readArrayOfStrings().map {
        (str: String) -> Int in
        return Int(str)!
    }
}

func findEquilibriumIndex(in array: [Int]) -> String {
    var leftSum = 0
    var rightSum = array.reduce(0, combine: +)

    for value in array {
        rightSum -= value

        if leftSum == rightSum {
            return "YES"
        }

        leftSum += value
    }

    return "NO"
}

let sampleArray = [2, 3, 1, 2, 3, 4, 1, 2, 3, 3]
let nTestCases = sampleArray.first!
var currentIndex = 1

for _ in 0..<nTestCases {
    let testCaseCount = sampleArray[currentIndex]
    let range = (currentIndex + 1)...(currentIndex + testCaseCount)
    print(findEquilibriumIndex(in: Array(sampleArray[range])))
    currentIndex += testCaseCount + 1
}
