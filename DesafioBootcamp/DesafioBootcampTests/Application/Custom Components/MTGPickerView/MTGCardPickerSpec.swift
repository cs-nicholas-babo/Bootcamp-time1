//
//  MTGCardPickerSpec
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class MTGCardPickerSpec: QuickSpec {
    
    override func spec() {
        describe("MTGCardPicker Spec") {
            
            var sut: MTGCardPicker!
            
            context("when initialized") {
                
                beforeEach {
                    sut = MTGCardPicker()
                }
                
                it("should have clear background") {
                    sut.layoutSubviews()
                    expect(sut.backgroundColor).to(equal(UIColor.clear))
                }
                
            }
            
        }
    }
    
}

