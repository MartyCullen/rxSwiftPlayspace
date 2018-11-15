//: [Previous](@previous)

import Foundation
import RxSwift


// A Subject is a special form of an Observable Sequence
// you can subscribe and dynamically add elements to it
// 4 different kinds of Subjects
// PublishSubject: If you subscribe to it you will get all the events that will happen after you subscribed.
// BehaviourSubject: A behavior subject will give any subscriber the most recent element and everything that is emitted by that sequence after the subscription happened.
// ReplaySubject: If you want to replay more than the most recent element to new subscribers on the initial subscription you need to use a ReplaySubject. With a ReplaySubject, you can define how many recent items you want to emit to new subscribers.
// Variable: A Variable is just a BehaviourSubject wrapper that feels more natural to a none reactive programmers. It can be used like a normal Variable.

let bag = DisposeBag()
var publishSubject = PublishSubject<String>()

// add some values (but before subscription, so never seen
publishSubject.onNext("Hello")
publishSubject.onNext("World")

let subscription1 = publishSubject.subscribe(onNext:{
    print($0)
}).addDisposableTo(bag)

// Subscription1 receives these 2 events, Subscription2 won't
publishSubject.onNext("Hello")
publishSubject.onNext("Again")

// Sub2 will not get "Hello" and "Again" because it susbcribed later
let subscription2 = publishSubject.subscribe(onNext:{
    print(#line,$0)
})
publishSubject.onNext("Both Subscriptions receive this message")



//: [Next](@next)
