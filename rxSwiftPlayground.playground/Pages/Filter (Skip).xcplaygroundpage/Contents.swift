//: [Previous](@previous)

import Foundation
import RxSwift

Observable.of(2,30,22,5,60,1).skip(2).subscribe(onNext:{
    print($0)
})

// You will get 22,5,60,1 because you skipped the first 2

//: [Next](@next)
