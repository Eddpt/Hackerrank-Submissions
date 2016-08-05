/*:

 # CamelCase

 Alice wrote a sequence of words in CamelCase as a string of letters, `s`, having the following properties:

 - It is a concatenation of one or more words consisting of English letters.
 - All letters in the first word are lowercase.
 - For each of the subsequent words, the first letter is uppercase and rest of the letters are lowercase.

 Given `s`, print the number of words in `s` on a new line.


 **Input Format**

 A single line containing string `s`.


 **Constraints**

 - 1 <= |s| <= 10^5

 **Output Format**

 Print the number of words in string `s`.

 **Sample Input**

 ```
 saveChangesInTheEditor
 ```

 **Sample Output**

 ```
 5
 ```

 **Explanation**

 String `s` contains five words:

 - save
 - Changes
 - In
 - The
 - Editor

 Thus, we print `5` on a new line.

 **Source:** [Hackerrank - CamelCase](https://www.hackerrank.com/challenges/camelcase)
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


let inputArray = ["saveChangesInTheEditor"] //readArrayOfStrings()
let capitalLettersRange = "A"..."Z"
var numberOfWords = 0

for (index, value) in inputArray.enumerate() {
    if !value.isEmpty {
        numberOfWords += 1

        for letter in value.characters {
            if capitalLettersRange.contains(String(letter)) {
                numberOfWords += 1
            }
        }
    }

    print(numberOfWords)

    numberOfWords = 0
}
