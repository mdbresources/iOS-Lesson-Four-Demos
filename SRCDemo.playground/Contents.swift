/**
 Created by Anmol Parande
 */

import UIKit

class Person {
    var name: String
    var home: Home! //Problem with this line
    
    init() {
        self.name = Person.randomNameGen()
    }
    
    static func randomNameGen() -> String {
        let names = ["James", "Olivia", "Michael", "Geo", "Ian", "Juliet", "Rini", "Nick", "Maggie", "Colin"]
        return names.randomElement()!
    }
    
    deinit {
        print("\(name) was murdered")
    }
}

class Home {
    var owner: Person?
    
    deinit {
        print("\(owner!.name)'s home was demolished")
    }
}

var person: Person? = Person()
var home: Home? = Home()

person?.home = home
home?.owner = person

home = nil
person = nil


