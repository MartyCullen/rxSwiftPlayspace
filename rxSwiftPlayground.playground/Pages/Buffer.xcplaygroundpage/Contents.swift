//: [Previous](@previous)

import Foundation
import RxSwift

// The Buffer operator transforms an Observable that emits items into an Observable that emits buffered collections of those items.
// It will ouput in groups of "count", dumping the remainter after timout of "timespan" seconds,

//var publishSubject = PublishSubject<Int>()
//
//publishSubject
//    .buffer(timeSpan: 10, count: 3, scheduler:MainScheduler.instance)
//    .subscribe(onNext:{
//        print($0)
//    })
//
//publishSubject.onNext(7)
//publishSubject.onNext(4)
//publishSubject.onNext(5)
//publishSubject.onNext(8)
//publishSubject.onNext(1)
//publishSubject.onNext(1)
//publishSubject.onNext(2)



struct testStruct {
    var delay = 0.0
    var number = 0
}

// Build a struct of numbers and how long to delay the injection of them
let items = [
    testStruct(delay: 0.3, number: 1),
    testStruct(delay: 1.2, number: 2),
    testStruct(delay: 0.2, number: 3),
    testStruct(delay: 0.5, number: 4),
    testStruct(delay: 0.8, number: 5),
    testStruct(delay: 20.0, number: 6),
]

let disposeBag = DisposeBag()
let pubSub = PublishSubject<testStruct>()

pubSub
    // Create an observable stream of integers at intervals from the struct
    .flatMap { element -> Observable<Int> in
        return Observable.just(element.number).delaySubscription(RxTimeInterval(element.delay), scheduler: MainScheduler.instance)
    }
    // Buffer the output
    .buffer(timeSpan: 10, count: 3, scheduler:MainScheduler.instance)
    // Subscribe to the stream
    .subscribe(onNext: { (i) in
        print(i)
    })
    // Clean up
    .addDisposableTo(disposeBag)

// Pass the elements of our struct to the subject
items.forEach({ (element) in
    pubSub.onNext(element)
})




// When you run this you will see 3 ints output (the 3 with the shortest delay)
// then the next 2, but there is short enough of a delay in the buffer that it does not wait for the third
// then the final one





//: [Next](@next)
