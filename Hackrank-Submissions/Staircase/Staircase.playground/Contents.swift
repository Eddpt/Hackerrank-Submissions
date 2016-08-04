/*:
 
 #Staircase

 Consider a staircase of size `n = 4`:

 ```
 #
 ##
 ###
 ####
 ```

 Observe that its base and height are both equal to `n`, and the image is drawn using `#` symbols and spaces. The last line is not preceded by any spaces.

 Write a program that prints a staircase of size `n`.

 **Input Format**

 A single integer, `n`, denoting the size of the staircase.

 **Output Format**

 Print a staircase of size `n` using `#` symbols and spaces.

 **Note:** The last line must have `0` spaces in it.

 **Sample Input**

 ```
 6
 ```

 **Sample Output**

 ```
 #
 ##
 ###
 ####
 #####
 ######
 ```

 **Explanation**

 The staircase is right-aligned, composed of `#` symbols and spaces, and has a height and width of `n = 6`.
 
 **Source:** [Hackerrank - Staircase](https://www.hackerrank.com/challenges/staircase)
 */

import Foundation

func readData() -> NSData {
    return NSFileHandle.fileHandleWithStandardInput().availableData
}

func readString() -> String {
    return String(data: readData(), encoding:NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func readInt() -> Int {
    return Int(readString())!
}

let n = 10 //readInt()

for index in 0..<n {
    var outputString = ""
    for subIndex in 0..<(n - index - 1) {
        outputString.append(" ".characters.first!)
    }
    for hashtagIndex in 0...index {
        outputString.append("#".characters.first!)
    }

    print(outputString)
}
