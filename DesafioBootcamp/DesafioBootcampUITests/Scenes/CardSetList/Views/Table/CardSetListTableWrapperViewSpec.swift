//
//  CardSetListTableWrapperViewSpec.swift
//  DesafioBootcampUITests
//
//  Created by ricardo.s.rachaus on 28/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioBootcamp

class CardSetListTableWrapperViewSpec: QuickSpec {
    
    override func spec() {
        describe("CardSetList Table WrapperView Spec") {
            
            var sut: CardSetListTableWrapperView!
            
            context("when initialized") {
                
                beforeEach {
                    let viewModel = CardSetList.ViewModel(cardSet: MockValue.cardSetMock)
                    sut = CardSetListTableWrapperView(frame: UIScreen.main.bounds)
                    sut.datasource.validSets = [viewModel]
                }
                
                it("should look like this") {
                    expect(sut) == snapshot()
                }
                
            }
            
        }
    }
    
}

