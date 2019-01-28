//
//  CardSetListCollectionViewCellSpec.swift
//  DesafioBootcampUITests
//
//  Created by miguel.horta.nery on 21/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioBootcamp

class CardSetListCollectionViewCellSpec: QuickSpec {
    
    override func spec() {
        describe("CardSetList Collection View Cell") {
            
            var sut: CardSetListCollectionViewCell!
            
            context("when displayed") {
                
                var cardFrame: CGRect!
                
                beforeEach {
                    cardFrame = CGRect(x: 0, y: 0, width: 63 * 3, height: 88 * 3)
                    sut = CardSetListCollectionViewCell(frame: cardFrame)
                    sut.imageView.backgroundColor = .green
                }
                
                it("should look like this") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
    
}
