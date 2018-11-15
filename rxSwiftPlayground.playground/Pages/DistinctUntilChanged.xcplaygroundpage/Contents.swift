//: [Previous](@previous)

import Foundation
import RxSwift

// If you just want to emit next Events if the value changed from previous ones you need to use distinctUntilChanged.

Observable.of(1,2,2,1,3).distinctUntilChanged().subscribe(onNext:{
    print($0)
})

// Explore Debounce, TakeDuration and Skip


//: [Next](@next)
