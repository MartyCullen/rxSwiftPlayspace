//: [Previous](@previous)

import Foundation
import RxSwift

// To transform Elements emitted from an observable Sequence, before they reach their subscribers, you use the map operator. Imagine a transformation that multiplies each value of a sequence with 10 before emitting.

Observable<Int>.of(1,2,3,4).map { value in
    return value * 10
    }.subscribe(onNext:{
        print($0)
    })


//: [Next](@next)
