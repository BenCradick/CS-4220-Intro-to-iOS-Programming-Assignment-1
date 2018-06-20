

/* ASSIGNMENT ONE - 40 points total
 
 PLAYGROUND INSTRUCTIONS
 *  - You can add any other functions (or method calls) you want to this file.
 *  - But the functions calls that are commented out must work EXACTLY as they are written. I grade your projects automatically, and will take off points if your playground does not compile.
 *  - You will need to research some of the capabilities of Swift (and potentially Foundation) to complete this playground.
 *  - Good luck!
*/

import Foundation

/* Problem 1 - 10 points
 Write a function that:
 - takes in an array of integers and separates each element of the array into odd and even numbers
 - then splits the array into lists that are sorted in DESCENDING order (largest first, smallest last)
 - finally, your function should return the sorted evens and odds as a tuple
 - Each element in the array COULD be nil. So you will have to figure out how to represent that in the parameter's type.
 - If an element in the array is nil, do nothing with it.
 - Don't forget to make sure your implementation works with edge cases like an empty array or all nil values.
 
 Notes:
 - Research how to return multiple values (as a named tuple) from Swift functions
 - DO NOT manually sort the integers; find a better way using Swift's libraries!
 - Your function MUST work with the commented out function calls below!
 */


// CODE HERE
func sortedEvenOdd(numbers: [Int?])->(evens: [Int], odds: [Int]){
    var odds = [Int]()
    var evens = [Int]()
    for value in numbers.indices{
        if let number = numbers[value]{
            if number % 2 == 0{
                evens.append(number)
            }
            else if number % 2 == 1{
                odds.append(number)
            }
        }
    }
    //Could not return evens and odds in the tuple with a method attached, had to do it before the return ¯\_(ツ)_/¯
    evens.sort(by: >)
    odds.sort(by: >)

    return (evens, odds)
}



let sortedNumbers = sortedEvenOdd(numbers: [123 , 343, 666, 677])
print(sortedNumbers.evens) // [20, 8, 2, 0]
print(sortedNumbers.odds)  // [15, 11, 9, 3]


/* Problem 2 - 15 points
   Write a function that generates a url string for making an HTTP GET request from a base url string and a dictionary of query parameters.
    - Lowercase the keys and values in the parameters.
    - Replace any spaces in the keys and values of the parameters with the encoded character "%20".
    - The order the parameters appear in the final query string is not important.
    - Don't forget to make sure your implementation works with edge cases like an empty parameter dictionary.

 Notes:
    - Your function MUST work with the commented out function calls below!
    - Look at the example output for how you need to construct your function
    - I will not use any harder examples to grade than in the example calls below.
    - You should explore some of the methods available on arrays and on strings (in both Swift and using the Foundation library which is already imported)
*/

// CODE HERE
func httpGetUrl(baseUrl: String?, parameters: [String: String?]?)-> String{
    var completeUrl: String
    let stubUrl = baseUrl ?? "http://boardgames.com/game"
    completeUrl = stubUrl
    if let params = parameters{
        completeUrl.append("?")
        for (paramKey, paramValue) in params {
            if let paramValue = paramValue{
                completeUrl.append("\(paramKey)=\(paramValue)&")
            }
        }
    }
    /*
     * String modifying functions don't seem to work in place therefore might as well chain their results into
     * a sequence of functions, I think seperating each function onto a seperate line is correct style
     * Additinoally .dropLast() returns a Sting.substring() so the result needed to be cast back to String
     */
    return String(
        completeUrl
            .replacingOccurrences(of: " ", with: "%20")
            .lowercased()
            .dropLast()
    )
}

let url1: String = httpGetUrl(baseUrl: "http://boardgames.com/game", parameters: ["Genre": "Strategy", "name": "Settlers Of Catan", "User Rating": "high"])
let url2: String = httpGetUrl(baseUrl: "http://boardgames.com/game", parameters: [:])
//
//// Sample Output: query params can be in any order
print(url1)  // "http://boardgames.com/game?user%20rating=high&name=settlers%20of%20catan&genre=strategy"
print(url2)  // "http://boardgames.com/game"
//



/* Problem 3 - 15 points
 Add two methods to the Shape enum listed below.
 - The first method `hasCorrectNumberOfVertices` should check whether or not the number of vertices passed in are correct based on the shape cases (triangle has 3 vertices, etc).
 - The second method `calculatePerimeterLength` should take in the array of vertices and return the perimeter length of the shape based on the vertices (which are just x, y coordinates). This method should use the first method to check that the number of vertices are correct and if not return nil for the perimeter length.

 Notes:
 - Your function MUST work with the commented out function calls below!
 - Use the standard distance formula for computing the distance between two points.
 - I will only make calls with the 3 cases listed below (triangle, rectangle, pentagon).
 - Process the vertices in the order they are in the array.
 - You can assume I will only give geometrically valid vertices.
 */

enum Shape {
    case triangle
    case rectangle
    case pentagon
}

let vertices: [(x: Double, y: Double)] = [
    (x: 5.0, y: 5.0),
    (x: 1.0, y: 3.0),
    (x: 3.0, y: -1)
]

// CODE HERE


//let triangle = Shape.triangle
//let correct: Bool = triangle.hasCorrectNumberOfVertices(vertices)
//let perimeter: Double? = triangle.calculatePerimeterLength(from: vertices)


