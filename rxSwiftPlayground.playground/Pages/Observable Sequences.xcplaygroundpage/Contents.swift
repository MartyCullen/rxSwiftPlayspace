import UIKit
import RxSwift

// https://medium.com/ios-os-x-development/learn-and-master-%EF%B8%8F-the-basics-of-rxswift-in-10-minutes-818ea6e0a05b

// everything in RxSwift is an observable sequence
// or something that operates on or subscribes to events emitted by an observable sequence.

let helloSequence = Observable.just("Hello Rx")
let fibonacciSequence = Observable.from([0,1,1,2,3,5,8])
let dictSequence = Observable.from([1:"Hello",2:"World"])

//Subscribe to observable sequence
let subscription = helloSequence.subscribe { event in
    print(event)
}

let anotherSequence = Observable.from(["H","e","l","l","o"])
let anotherSubscription = anotherSequence.subscribe { event in
    switch event {
    case .next(let value):
        print(value)
    case .error(let error):
        print(error)
    case .completed:
        print("completed")
    }
}

// Observable sequences can emit zero or more events
//   .next(value: T)
//   .error(error: Error)
//   .completed


// Creating a DisposeBag so subscribtion will be cancelled correctly
let bag = DisposeBag()
// Creating an Observable Sequence that emits a String value
let observable = Observable.just("Hello Rx!")
// Creating a subscription just for next events
let subscription3 = observable.subscribe (onNext:{
    print($0)
})
// Adding the Subscription to a Dispose Bag
subscription3.addDisposableTo(bag)

//: [Next](@next)

