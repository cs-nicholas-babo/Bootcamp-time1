//
//  CardSetListPresentationLogicMock.swift
//  DesafioBootcampTests
//
//  Created by miguel.horta.nery on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

@testable import DesafioBootcamp

final class CardSetListPresentationLogicMock: CardSetListPresentationLogic {
    
    var willPresentCards = false
    var isReadyToPresent = false
    var didPresentError = false
    
    func present(response: CardSetList.Response) {
        
        switch response {
        case .success(let cardSet):
            self.willPresentCards = true
        case .readyToPresentSets:
            self.isReadyToPresent = true
        case .error:
            self.didPresentError = true
        }
    }
}
