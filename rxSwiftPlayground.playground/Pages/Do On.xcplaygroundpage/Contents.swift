//: [Previous](@previous)

import Foundation
import RxSwift

// If you want to register callbacks that will be executed when certain events take place
// on an Observable Sequence you need to use the doOn Operator.
// It will not modify the emitted elements but rather just pass them through.

Observable.of(1,2,3,4,5).do(onNext: {
    $0 * 10 // This has no effect on the actual subscription
}).subscribe(onNext:{
    print($0)
})

//: [Next](@next)
