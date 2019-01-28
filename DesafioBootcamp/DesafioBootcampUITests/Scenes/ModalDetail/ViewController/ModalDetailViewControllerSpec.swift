//
//  ModalDetailViewControllerSpec.swift
//  DesafioBootcampUITests
//
//  Created by ricardo.s.rachaus on 28/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioBootcamp

class ModalDetailViewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("Modal Detail ViewController Spec") {
            
            var sut: ModalDetailViewController!
            
            context("when initialized") {
                
                beforeEach {
//                    sut = ModalViewControllerFactory.make(subset: MockValues.subsetMock)
                }
                
                it("should have mock subset") {
//                    expect(sut) == recordSnapshot()
                }
                
            }
            
        }
    }
    
}

