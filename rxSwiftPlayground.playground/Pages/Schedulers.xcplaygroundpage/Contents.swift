//: [Previous](@previous)

import Foundation
import RxSwift

// Operators will work on the same thread as where the subscription is created.
// In RxSwift you use schedulers to force operators do their work on a specific queue.
// You can also force that the subscription should happen on a specifc Queue.
// You use subscribeOn and observeOn for those tasks.
// If you are familiar with the concept of operation-queues or dispatch-queues this should be nothing special for you.
// A scheduler can be serial or concurrent similar to GCD or OperationQueue.
// There are 5 Types of Schedulers in RxSwift:

// MainScheduler — “Abstracts work that needs to be performed on MainThread. In case schedule methods are called from the main thread, it will perform the action immediately without scheduling.This scheduler is usually used to perform UI work.”
// CurrentThreadScheduler — “Schedules units of work on the current thread. This is the default scheduler for operators that generate elements.”
// SerialDispatchQueueScheduler — “Abstracts the work that needs to be performed on a specific dispatch_queue_t. It will make sure that even if a concurrent dispatch queue is passed, it's transformed into a serial one.Serial schedulers enable certain optimizations for observeOn.The main scheduler is an instance of SerialDispatchQueueScheduler"
// ConcurrentDispatchQueueScheduler — “Abstracts the work that needs to be performed on a specific dispatch_queue_t. You can also pass a serial dispatch queue, it shouldn't cause any problems. This scheduler is suitable when some work needs to be performed in the background.”
// OperationQueueScheduler — “Abstracts the work that needs to be performed on a specific NSOperationQueue. This scheduler is suitable for cases when there is some bigger chunk of work that needs to be performed in the background and you want to fine tune concurrent processing using maxConcurrentOperationCount.”

let publish1 = PublishSubject<Int>()
let publish2 = PublishSubject<Int>()
let concurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
Observable.of(publish1,publish2)
    .observeOn(concurrentScheduler)
    .merge()
    .subscribeOn(MainScheduler())
    .subscribe(onNext:{
        print($0)
    })
publish1.onNext(20)
publish1.onNext(40)

//: [Next](@next)
