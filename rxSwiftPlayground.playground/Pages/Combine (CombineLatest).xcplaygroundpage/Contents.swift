//: [Previous](@previous)

import Foundation
import RxSwift

// Merges the specified observable sequences into one observable sequence whenever any of the observable sequences produces an element.

//let numbers     : Observable<Int>    = Observable.from([1,2,3])
//let names       : Observable<String> = Observable.from(["Alpha", "Beta"])
//
//
//let combined = Observable.combineLatest(
//    numbers.map { /* map everything to optional */ Optional.some($0) }.startWith(nil),
//    names.startWith("")
//) { number, name in
//    // combine item and text
//    print("\(number) \(name)")
//}

//let currentHours:Variable<Float> = Variable(0.0)
//let currentRate:Variable<Float>  = Variable(0.0)
//
//let hoursAndRate = Observable.combineLatest(currentHours.asObservable(), currentRate.asObservable()){
//    return $0 + $1
//}
//
//print(hoursAndRate)
//currentRate.value = 7.1
//currentHours.value = 40.0



let dispose = DisposeBag()

let a /*: Observable<Int>*/ = Variable(1)   // a = 1
let b /*: Observable<Int>*/ = Variable(2)   // b = 2

let d = a.asObservable()
let e = b.asObservable()

let c = Observable.combineLatest(d, e) {
    $0 + $1
    }
    .filter { $0 >= 0 }
    .map { "\($0) is positive" }

c.subscribe(
    onNext: { i in
        print(i)
}
    ).addDisposableTo(dispose)

a.value = -10
b.value = 7
b.value = 100


// This will return a 3 initally ( 1+2 = 3 )
// This will return nothing on the next change ( -10+2 = -7 ) because it is < 0
// This will return nothing on the next change ( -10+7 = -3 ) because it is < 0
// This will return a 90 on the next change ( -10+100 = 90 )

//: [Next](@next)
