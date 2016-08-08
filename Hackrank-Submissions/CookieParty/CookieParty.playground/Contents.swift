/*:

 # Cookie Party
 
 You're having a cookie party tonight! You're expecting `n` guests and you've already made `m` cookies. You want to distribute all the cookies evenly between your guests in such a way that each guest receives the same number of whole cookies. If there are not enough cookies to give everyone the same amount, you must make some number of additional cookies.

 Given `n` and `m`, find and print the minimum number of additional cookies you must make so that everybody receives the same number of cookies.

 **Input Format**

 A single line of two space-separated integers describing the respective values of `n` and `m`.

 **Constraints**

 - `1 <= n,m <= 10^9`

 **Output Format**

 Print a single integer denoting the number of additional cookies you need to make so that everyone at the cookie party has the same number of whole cookies.

 **Sample Input**

 ```
 3 2
 ```

 **Sample Output**

 ```
 1
 ```

 **Explanation**

 There are `n = 3` people coming to your party and you've made `2` cookies. For each person to have the same number of whole cookies, you must make `1` additional cookie. Thus, we print `1` as our answer.
 
 **Source:** [Hackerrank - Cookie Party](https://www.hackerrank.com/contests/w22/challenges/cookie-party)

 */
import Foundation

func readData() -> NSData {
    return NSFileHandle.fileHandleWithStandardInput().availableData
}

func readString() -> String {
    return String(data: readData(), encoding:NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
}

func readArrayOfStrings() -> Array<String> {
    return readString().componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
}

func readArrayOfInts() -> Array<Int> {
    return readArrayOfStrings().map {
        (str: String) -> Int in
        return Int(str)!
    }
}

let input = [3, 2] //readArrayOfInts()

let nGuests = input.first!
let mCookies = input.last!

let remainder = (mCookies % nGuests)

print((remainder == 0) ? 0 : (nGuests - remainder))
