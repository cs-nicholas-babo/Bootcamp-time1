//
//  CardSetListViewControllerSpec.swift
//  DesafioBootcampUITests
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioBootcamp

class CardSetListViewControllerSpec: QuickSpec {
    override func spec() {
        describe("CardSetListViewControllerSpec") {
            
            var sut: UIViewController!
            
            context("when initialized") {
                
                beforeEach {
                    sut = FeedCardSetListFactory.make()
                }
                
                // TODO: Update test
                it("should be on loading state") {
                    expect(sut) == snapshot()
                }
                
            }
        }
    }
}
