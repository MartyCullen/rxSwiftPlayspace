//: [Previous](@previous)

import Foundation
import RxSwift

// Only emit an item from an Observable if a particular timespan has passed without it emitting another item

Observable.of(1,2,2,1,3).distinctUntilChanged().subscribe(onNext:{
    print($0)
})

//: [Next](@next)
