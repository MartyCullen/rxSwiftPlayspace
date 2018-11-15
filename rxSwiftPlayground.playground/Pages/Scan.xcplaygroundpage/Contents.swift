//: [Previous](@previous)

import Foundation
import RxSwift

// Scan starts with an initial seed value and is used to aggregate values just like reduce in Swift.

Observable.of(1,2,3,4,5).scan(0) { seed, value in
    return seed + value
    }.subscribe(onNext:{
        print($0)
    })

//: [Next](@next)
