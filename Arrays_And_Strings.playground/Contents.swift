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

// 1.2 Given two strings, write a method to decide if one is a permutation of the other.
/*
 Assume this problem has case sensitive and and two strings have the same lenght, included whitespace
 Bruteforce solution
 Time Complex: O(nlogn) + O(n) => total O(nlogn)
 Space: O(n)
 */
func solvePermutationBruteForce(firstStr: String, secondStr: String) -> Bool {
    if (firstStr.count != secondStr.count) {
        //two strings have difference length
        return false
    }
    
    // Swift use IntroSort with O(nlogn)
    let sorted1 = firstStr.sorted()
    let sorted2 = secondStr.sorted()
    
    return sorted1 == sorted2 //O(n)
}

/*
 Assume this problem has case sensitive and and two strings have the same lenght, included whitespace
 Using dictionary solution
 Time Complex: O(n)
 Space: O(n^2)
 */
func solvePermutationWithDictionary(firstStr: String, secondStr: String) -> Bool {
    if (firstStr.count != secondStr.count) {
        //two strings have difference length
        return false
    }
    
    var dicToCheck = [Character:Int]()
    for char in firstStr {
        //O(n)
        if var count = dicToCheck[char] {
            count += 1
            dicToCheck[char] = count
        }
        else {
            dicToCheck[char] = 1
        }
    }
    
    for char in secondStr {
        //O(n)
        if (dicToCheck[char] == nil) {
            return false
        }
    }
    
    return true
}

// MARK: - TEST
var str1 = "hello world"
var str2 = "lloherldwo "
print("isunique: \(solvePermutationWithDictionary(firstStr: str1, secondStr: str2))")
