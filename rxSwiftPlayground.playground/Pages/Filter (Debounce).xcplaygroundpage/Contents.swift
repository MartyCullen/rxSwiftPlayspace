//: [Previous](@previous)

import Foundation
import RxSwift

struct testStruct {
    var delay = 0.0
    var number = 0
}

// Build a struct of numbers and how long to delay the injection of them
let items = [
    testStruct(delay: 0.3, number: 1),
    testStruct(delay: 1.2, number: 2),
    testStruct(delay: 1.3, number: 3),
    testStruct(delay: 1.4, number: 4),
    testStruct(delay: 2.5, number: 5),
    testStruct(delay: 3.5, number: 6),
]

let disposeBag = DisposeBag()
let pubSub = PublishSubject<testStruct>()

pubSub
    // Create an observable stream of integers at intervals from the struct
    .flatMap { element -> Observable<Int> in
        return Observable.just(element.number).delaySubscription(RxTimeInterval(element.delay), scheduler: MainScheduler.instance)
    }
    // Debounce the output
    .debounce(0.33, scheduler: MainScheduler.instance)
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


// When you run this you will see 1, 4, 5, 6
// 2 and 3 are suppressed because they are all bunched up with 4, and are not reported



//: [Next](@next)
