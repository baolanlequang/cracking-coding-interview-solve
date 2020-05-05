import UIKit

// MARK: - QUESTIONS AND SOLUTIONS
// 1.1 Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
/*
 Assume input is ASCII
 Time Complex: O(n)
 Space: O(c) where c is size of boolArr
 */
func solveIsUniqueAscii(inputStr: String) -> Bool {
    if (inputStr.count > 128) {
        return false
    }
    //init an Bool array with 128 elements
    var boolArr = [Bool](repeating: false, count: 128)
    for char in inputStr {
        if (char.isASCII) {
            let asciiVal = Int(char.asciiValue!)
            if (boolArr[asciiVal]) {
                //check if constains value
                return false
            }
            boolArr[asciiVal] = true
        }
    }
    return true
}

/*
 Assume input is normal string
 Bruteforce solution
 Time Complex: O(n^2)
 Space: O(n)
 */
func solveIsUniqueBruteForce(inputStr: String) -> Bool {
    for index1 in 0..<inputStr.count {
        for index2 in (index1+1)..<inputStr.count {
            let firstIndex = inputStr.index(inputStr.startIndex, offsetBy: index1)
            let lastIndex = inputStr.index(inputStr.startIndex, offsetBy: index2)
            if (inputStr[firstIndex] == inputStr[lastIndex]) {
                return false
            }
        }
    }
    return true
}

// MARK: - TEST
var str = "Helo, wrd"
print("isunique: \(solveIsUniqueBruteForce(inputStr: str))")
