/*:
 # GCD Demo
 Modified From https://gist.github.com/drosenstark/64bd538eed5a9382f1fede9e880b3947
*/

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let useLocks = false

var counter : Int = 0

func incrementCounter(contextName:String) {
    let originalCounterValue = counter
    counter = counter + 1
    if counter != originalCounterValue + 1 {
        print("\(contextName):\(counter) Data Collision")
    } else {
        print("\(contextName):\(counter) OK")
    }
}

func callIncrement(name:String, useLock: Bool) {
    if useLock {
        DispatchQueue.main.async {
            incrementCounter(contextName: name)
        }
    } else {
        incrementCounter(contextName: name)
    }
}

DispatchQueue.global(qos: .background).async {
    for _ in 0..<100 {
        callIncrement(name: "ONE", useLock: useLocks)
    }
}

DispatchQueue.global(qos: .background).async {
    for _ in 0..<100 {
        callIncrement(name: "TWO", useLock: useLocks)
    }
}
