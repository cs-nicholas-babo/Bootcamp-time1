//
//  APIGateway.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import PlatformAPI
import Domain

class APIGateway: MTGSetFetcher {
    
    let service = MTG_Service()
    var metaSets = [MetaCardSet]()
    
    private var didFetchMetaSets = false
    
    private func fetchMetaSets(_ completion: @escaping (Result<[MetaCardSet]>) ->Void) {
        self.service.fetchSets { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let metaSets):
                self.metaSets = metaSets
                self.didFetchMetaSets = true
            case .failure: break
            }
            
            completion(result)
            
        }
    }

    func fetchSets(_ completion: @escaping (Result<[CardSet]>) -> Void) {
        guard didFetchMetaSets else {
            fetchMetaSets { [weak self] result in
                guard let self = self else { fatalError() }
                switch result {
                case .success:
                    self.fetchSets(completion)
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            return
        }
        
        guard let set = self.metaSets.first else { return }
        
        service.fetchCards(from: set) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let cards):
                let cardSet = CardSet(set, cards)
                _ = self.metaSets.dropFirst()
                completion(.success([cardSet]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
