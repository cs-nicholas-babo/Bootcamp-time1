//
//  MTGCardViewPickerSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class MTGCardViewPickerSpec: QuickSpec {
    
    override func spec() {
        describe("MTGCardViewPicker Spec") {
            
            var sut: MTGCardViewPicker!
            
            context("when initialized") {
                
                beforeEach {
                    sut = MTGCardViewPicker()
                }
                
                it("should have clear background color") {
                    sut.layoutSubviews()
                    expect(sut.backgroundColor).to(equal(UIColor.clear))
                }
                
            }
            
        }
    }
    
}

