//: [Previous](@previous)

import Foundation
import RxSwift

// Transforms an observable sequence of observable sequences into an observable sequence
// producing values only from the most recent observable sequence.
// Each time a new inner observable sequence is received, unsubscribe from the
// previous inner observable sequence.


// THIS SAMPLE IS BROKEN
// https://stackoverflow.com/questions/39119601/rxswift-need-help-using-flatmap-and-reduce/39805775#39805775

let rawPassword = wordCount
    .asObservable()
    .map { wordCount in
        self.rollDice(numberOfDice: wordCount)
            .map { numbers in wordMap[numbers]! }
}

let reducedPassword = Observable.combineLatest(rawPassword, separator.asObservable()) {
    raw, sep in
    
    raw.reduce("") { prev, value in
        prev == "" ? value : "\(prev)\(sep)\(value)"
    }
    }
    .switchLatest() // equivalent to: .flatMap { $0 }

//: [Next](@next)
