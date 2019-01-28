//
//  CardSetListPresentationLogicMock.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

@testable import DesafioBootcamp

final class CardSetListPresentationLogicMock: CardSetListPresentationLogic {
    
    var didPresentCards = false
    var isReadyToPresent = false
    var didPresentError = false
    
    var receivedCardSets = [CardSet]()
    
    func present(response: CardSetList.Response) {
        switch response {
        case .success(let cardSet):
            self.didPresentCards = true
            self.receivedCardSets = cardSet
        case .readyToPresentSets:
            self.isReadyToPresent = true
        case .error:
            self.didPresentError = true
        case .searchResults(_):
            break
        }
    }
}
