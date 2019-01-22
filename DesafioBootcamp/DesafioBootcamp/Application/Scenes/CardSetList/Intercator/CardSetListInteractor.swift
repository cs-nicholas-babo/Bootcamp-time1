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
    private let cardGateway: MTGCardGateway
    private var metaSets = [MetaCardSet]()
    
    init(presenter: CardSetListPresentationLogic, cardGateway: MTGCardGateway) {
        self.presenter = presenter
        self.cardGateway = cardGateway
    }
}

extension CardSetListInteractor: CardSetListBusinessLogic {
    func fetchSet() {
        guard let currentSet = self.metaSets.first else {
            return
        }
    
        self.cardGateway.fetchSet(of: currentSet) { [weak self] result in
            guard let self = self else { fatalError() }
            switch result {
            case .success(let cardSet):
                self.presenter.present(response: .success(cardSet))
                _ = self.metaSets.dropFirst()

            case .failure(let error):
                print("\(error.errorCode): \(error.error)")
                self.presenter.present(response: .error)
            }
        }
    }
}
