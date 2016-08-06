/*: 
 
 # Operators
 
 **Objective**

 In this challenge, you'll work with arithmetic operators. Check out the [Tutorial](https://www.hackerrank.com/challenges/30-operators/tutorial) tab for learning materials and an instructional video!

 **Task**
 
 Given the meal price (base cost of a meal), tip percent (the percentage of the meal price being added as tip), and tax percent (the percentage of the meal price being added as tax) for a meal, find and print the meal's total cost.

 **Note:** Be sure to use precise values for your calculations, or you may end up with an incorrectly rounded result!

 **Input Format**

 There are `3` lines of numeric input:
 
 - The first line has a double, `mealCost` (the cost of the meal before tax and tip).
 - The second line has an integer, `tipPercent` (the percentage of  being added as tip).
 - The third line has an integer, `taxPercent` (the percentage of  being added as tax).

 **Output Format**

 Print `"The total meal cost is totalCost dollars."`, where `totalCost` is the rounded integer result of the entire bill (`mealCost` with added tax and tip).

 **Sample Input**

 ```
 12.00
 20
 8
 ```

 **Sample Output**
 
 ```
 The total meal cost is 15 dollars.
 ```

 **Explanation**

 Given:

 `mealCost = 12`, `tipPercent = 20`, `taxPercent = 8`

 Calculations:

 - `tip = 12 * 20 / 100 = 2.4`
 - `tax = 12 * 8 / 100 = 0.96`
 - `totalCost = mealCost + tip + tax = 12 + 2.4 + 0.96 = 15.36`
 - `round(totalCost) = 15`

 We round `totalCost` to the nearest dollar (integer) and then print our result:
 
 ```
 The total meal cost is 15 dollars.
 ```

 **Source:** [Hackerrank - Operators](https://www.hackerrank.com/challenges/30-operators)
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

func readArrayOfDoubles() -> Array<Double> {
    return readArrayOfStrings().map {
        (str: String) -> Double in
        return Double(str)!
    }
}

let input = [12.0, 20, 8] //readArrayOfDoubles()

let mealCost = input.first!
let tipPercent = input[1]
let taxPercent = input.last!

let tip = mealCost * (tipPercent / 100)
let tax = mealCost * (taxPercent / 100)

let totalMealCost = mealCost + tip + tax

print("The total meal cost is \(Int(round(totalMealCost))) dollars.")
