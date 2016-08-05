/*:
 
 # Minimum Distances
 
 Consider an array of `n` integers, `A = [a0, a1, a2, ..., a(n-1)]`. The distance between two indices, `i` and `j`, is denoted by `d(i,j) = |i - j|`.

 Given `A`, find the minimum `d(i,j)` such that `ai = aj` and `i != j`. In other words, find the minimum distance between any pair of equal elements in the array. If no such value exists, print `-1`.

 **Note:** `|a|` denotes the absolute value of `a`.

 **Input Format**

 The first line contains an integer, `n`, denoting the size of array `A`.
 The second line contains `n` space-separated integers describing the respective elements in array `A`.

 **Constraints**
 
 - `1 <= n <= 10^3`
 - `1 <= ai <= 10^5`

 **Output Format**

 Print a single integer denoting the minimum `d(i,j)` in `A`; if no such value exists, print `-1`.

 **Sample Input**

 ```
 6
 7 1 3 4 1 7
 ```

 **Sample Output**

 ```
 3
 ```

 **Explanation**

 Here, we have two options:

 - `a1` and `a4` are both `1`, so `d(1,4) = |1 - 4| = 3`.
 - `a0` and `a5` are both `7`, so `d(0,5) = |0 - 5| = 5`.
 
 The answer is `min(3,5) = 3`.

 **Source:** [Hackerrank - Minimum Distances](https://www.hackerrank.com/challenges/minimum-distances)
 */

import Foundation

func readData() -> NSData {
    return NSFileHandle.fileHandleWithStandardInput().availableData
}

func readString() -> String {
    return String(data: readData(), encoding:NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
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

let input = [6, 7, 1, 3, 4, 1, 7] //readArrayOfInts()
let sampleInput = Array(input[1..<input.count])

func minimumDistances(withSampleInput sampleInput: [Int]) -> Int {
    var numbersCount: [Int: Int] = [:]
    var minimumDistance = Int.max

    for (index, number) in sampleInput.enumerate() {
        if let pastIndex = numbersCount[number] {
            let distance = index - pastIndex

            minimumDistance = min(minimumDistance, distance)

            if minimumDistance == 1 {
                break
            }
        }
        
        numbersCount[number] = index
    }

    return (minimumDistance == Int.max) ? -1 : minimumDistance
}

print(minimumDistances(withSampleInput: sampleInput))
