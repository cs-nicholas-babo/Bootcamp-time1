//
//  CardSetListCollectionViewSpec.swift
//  DesafioBootcampUITests
//
//  Created by ricardo.s.rachaus on 21/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import DesafioBootcamp

class CardSetListCollectionViewSpec: QuickSpec {
    
    override func spec() {
        describe("CardSetList CollectionView") {
            context("when initialized") {
                
                var sut: CardSetListCollectionView!
                
                beforeEach {
                    sut = CardSetListCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
                    sut.backgroundColor = .green
                }
                
                it("should look like this") {
                    expect(sut) == snapshot()
                }
                
            }
        }
    }
    
}
