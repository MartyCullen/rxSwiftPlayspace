//: [Previous](@previous)

import Foundation
import RxSwift

// The Basic filter Operation works similar to the swift equivalent.
// You just define a condition that needs to be passed and if the condition is fulfilled
// a .next event will be emitted to its subscribers.

Observable.of(2,30,22,5,60,1).filter{$0 > 10}.subscribe(onNext:{
    print($0)
})

//: [Next](@next)
