//
//  PrintSpec.swift
//  UnexpectedPrint
//
//  Created by Robbie Bykowski on 12/02/2015.
//  Copyright (c) 2015 Helium End. All rights reserved.
//

import Foundation
import Nimble
import Quick

enum SpamEggs : Printable {
    case Spam
    case Eggs
    
    var description: String {
        switch self {
            case .Spam:
                return "SpamEggs.Spam"
            case .Eggs:
                return "SpamEggs.Eggs"
        }
    }
}


struct Foo : Printable {
    let spamEggs:SpamEggs

    init(spamEggs:SpamEggs) {
        self.spamEggs = spamEggs
    }
    
    var description:String {
        return "Foo{\(spamEggs)}"
    }
}

class PrintSpec: QuickSpec {
    override func spec() {
        it("should fail with simple object") {
            let foo:Foo? = Foo(spamEggs: SpamEggs.Eggs)
            expect(foo).to(beNil())
        }
        
        it("should fail with array") {
            let foo:[Foo]? = [Foo(spamEggs: SpamEggs.Eggs)]
            expect(foo).to(beNil())
        }
    }
}
