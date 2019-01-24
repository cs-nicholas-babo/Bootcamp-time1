//
//  MTGTabBarControllerSpec.swift
//  DesafioBootcampTests
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble

@testable import DesafioBootcamp

class MTGTabBarControllerSpec: QuickSpec {
    
    override func spec() {
        describe("MTG TabBarController") {
            
            var sut: MTGTabBarController!
            
            context("when initialized") {
                
                beforeEach {
                    sut = MTGTabBarController()
                }
                
                it("should have clear background") {
                    expect(sut.view.backgroundColor).to(equal(UIColor.clear))
                }
                
            }
            
        }
    }
    
}

