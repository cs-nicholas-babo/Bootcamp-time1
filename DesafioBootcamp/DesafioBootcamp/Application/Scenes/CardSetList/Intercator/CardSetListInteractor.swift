//
//  CardSetListInteractor.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

final class CardSetListInteractor {
    private let presenter: CardSetListPresentationLogic
    private let cardGateway: MTGSetFetcher
    
    init(presenter: CardSetListPresentationLogic, cardGateway: MTGSetFetcher) {
        self.presenter = presenter
        self.cardGateway = cardGateway
    }
}

extension CardSetListInteractor: CardSetListBusinessLogic {
    func fetchSet() {
        self.cardGateway.fetchSets() { [weak self] result in
            guard let self = self else { fatalError() }
            switch result {
            case .success(let cardSet):
                self.presenter.present(response: .success(cardSet))

            case .failure(let error):
                print("\(error.errorCode): \(error.error)")
                self.presenter.present(response: .error)
            }
        }
    }
}
