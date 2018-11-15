//: [Previous](@previous)

import Foundation
import RxSwift

// You can combine the output of multiple Observables so that they act like a single Observable, by using the Merge operator.

let publish1 = PublishSubject<Int>()
let publish2 = PublishSubject<Int>()
Observable.of(publish1,publish2).merge().subscribe(onNext:{
    print($0)
})
publish1.onNext(20)
publish1.onNext(40)
publish1.onNext(60)
publish2.onNext(1)
publish1.onNext(80)
publish2.onNext(2)
publish1.onNext(100)

//: [Next](@next)
