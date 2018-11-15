//: [Previous](@previous)

import Foundation
import RxSwift

// You use the Zip method if you want to merge items emitted by different observable sequences to one observable sequence. Zip will operate in strict sequence, so the first two elements emitted by Zip will be the first element of the first sequence and the first element of the second sequence combined. Keep also in Mind that Zip will only emit as many items as the number of items emitted of the source Observables that emits the fewest items.

let a = Observable.of(1,2,3,4,5)
let b = Observable.of("a","b","c","d")
Observable.zip(a,b){ return ($0,$1) }.subscribe {
    print($0)
}

// research Concat, CombineLatest, SwitchLatests

//: [Next](@next)
