/*:
 
 # Ransom
 
 A bad person want to create a ransom using words from an Article (can be large).
 
 Just like a real ransom, words cannot be reused (think about cutting the words out of a magazine).
 
 There are no punctuation symbols.

 Create a function that given a very large article and a ransom, checks if it is possible to create
 said ransom using solely words from the article.
 
 The first string represents the Ransom.
 The remaining strings represent the Article to be used.

 **Sample Input**

 ```
 Give 100 for dog
 John left his house with Max, his dog, for a walk. They wanted to play in the grass, but John remembered that time he had to pay a fine of 100 because Max did a bad thing
 ```

 **Sample Output**

 ```
 true
 ```

 */

import Foundation

func isRansomPossible(withRansom ransom: String, article: String) -> Bool {
    var ransomWords: [String:Int] = [:]

    for word in ransom.componentsSeparatedByString(" ") {
        let lowercaseWord = word.lowercaseString

        ransomWords[lowercaseWord] = (ransomWords[lowercaseWord] ?? 0) + 1
    }

    print(ransomWords)

    for word in article.componentsSeparatedByString(" ") {
        let lowercaseWord = word.lowercaseString

        guard let wordCount = ransomWords[lowercaseWord] else {
            continue
        }

        ransomWords[lowercaseWord] = wordCount - 1

        if ransomWords[lowercaseWord] == 0 {
            ransomWords.removeValueForKey(lowercaseWord)
        }

        if ransomWords.isEmpty {
            return true
        }
    }
    
    return false
}

let ransom = "Give 100 for dog"
let article = "John left his house with Max his dog for a walk They wanted to play in the grass but John remembered that time he had to pay a fine of 100 because Max didn't give a damn"

print(isRansomPossible(withRansom: ransom, article: article))

/*:
 
 # Explanation

 **Version 1**

 Iterating through the words in the Ransom, and for each one iterate through all the words in the Article leads to a
 worst case scenario of `O(R x A)`, `R` being the number of words in the Ransom and `A` the number of words in the Article.
 
 **Version 2**

 A better solution is to build a dictionary with all the words and its count first.
 
 If we assume that `sizeOf(A) >> sizeOf(R)`, iterating through all the words in the Article and building a dictionary out
 of it will always have a solution of `O(A+R) ~= O(A)`.
 
 **Version 3**

 Iterate through all the words in the Ransom, build a dictionary out of it, and then run through the words in Article, one by one, checking if they are needed for the Ransom.

 - If needed, deduct the count in the dictionary until it reaches `0`.
 - When it reaches `0`, delete the key from the dictionary of Ransom words.
 - Check on each iteration if the dictionary of Ransom words is empty
 
 When the dictionary becomes empty it means that we were able to create the Ransom, thus returning `true`.
 
 This is a better solution because, a Best case scenario would be that all the words needed for the Ransom
 are the first words of the Article, thus `O(R)`.
 Worst case scenario we have to iterate through all the words in the Article, thus `O(A)`, like the previous solution
 */

