//: [Previous](@previous)

import Foundation
import RxSwift

// Concatenates the second observable sequence to `self` upon successful termination of `self`.

let numbers     : Observable<Int>    = Observable.from([1,2,3])
let moreNumbers : Observable<Int>    = Observable.from([4,5,6])
let names       : Observable<String> = Observable.from(["Jose Rizal", "Leonor Rivera"])


// This works
numbers.concat(moreNumbers)

// Compile error (Must be of same type)
numbers.concat(names)


//: [Next](@next)
