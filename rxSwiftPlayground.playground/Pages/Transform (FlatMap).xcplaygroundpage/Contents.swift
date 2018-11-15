//: [Previous](@previous)

import Foundation
import RxSwift

// Imagine an Observable Sequence that consists of objects that are themselves Observables and you want to create a new Sequence from those. This is where FlatMap comes into play. FlatMap merges the emission of these resulting Observables and emitting these merged results as its own sequence.

let sequence1  = Observable<Int>.of(1,2)
let sequence2  = Observable<Int>.of(1,2)
let sequenceOfSequences = Observable.of(sequence1,sequence2)
sequenceOfSequences.flatMap{ return $0 }.subscribe(onNext:{
    print($0)
})
//: [Next](@next)
