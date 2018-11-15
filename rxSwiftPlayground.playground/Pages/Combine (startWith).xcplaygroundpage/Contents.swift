//: [Previous](@previous)

import Foundation
import RxSwift

// If you want an Observable to emit a specific sequence of items before it begins emitting the items normally expected from it, use the startWith operator.

Observable.of(2,3).startWith(1).subscribe(onNext:{
    print($0)
})

//: [Next](@next)
