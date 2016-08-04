/*:

 # Sparse Arrays

 There are `N` strings. Each string's length is no more than `20` characters. There are also `Q` queries. For each query, you are given a string, and you need to find out how many times this string occurred previously.

 **Input Format**

 The first line contains `N`, the number of strings.
 The next `N` lines each contain a string.
 The `N + 2nd` line contains `Q`, the number of queries.
 The following `Q` lines each contain a query string.

 **Constraints**

 - `1 <= N <= 1000`
 - `1 <= Q <= 1000`
 - `1 <= length of any string <= 20`

 **Sample Input**

 ```
 4
 aba
 baba
 aba
 xzxb
 3
 aba
 xzxb
 ab
 ```

 **Sample Output**

 ```
 2
 1
 0
 ```

 **Explanation**

 Here, "aba" occurs twice, in the first and third string. The string "xzxb" occurs once in the fourth string, and "ab" does not occur at all.
 
 **Source:** [Hackerrank - Sparse Arrays](https://www.hackerrank.com/challenges/sparse-arrays)
 */
import Foundation

func readData() -> NSData {
    return NSFileHandle.fileHandleWithStandardInput().availableData
}

func readString() -> String {
    return String(data: readData(), encoding:NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func readArrayOfStrings() -> Array<String> {
    return readString().componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func readInt() -> Int {
    return Int(readString())!
}

let input = ["4", "aba", "baba", "aba", "xzxb", "3", "aba", "xzxb", "ab"] // readArrayOfStrings()
let numberOfStrings = Int(input.first!)!
let sampleStrings = Array(input[1...numberOfStrings])

let numberOfQueries = Int(input[numberOfStrings + 1])!
let sampleQueries = Array(input[(numberOfStrings + 2)..<input.count])
var stringsCount: [String: Int] = [:]

for string in sampleStrings {
    var newValue = 1
    if let currentValue = stringsCount[string] {
        newValue += currentValue
    }

    stringsCount[string] = newValue
}

for query in sampleQueries {
    print(stringsCount[query] ?? 0)
}
