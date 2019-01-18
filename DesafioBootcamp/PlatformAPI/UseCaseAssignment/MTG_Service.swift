//
//  MTG_Service.swift
//  PlatformAPI
//
//  Created by nicholas.r.babo on 17/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import Moya
import Alamofire

public final class MTG_Service: Domain.CardsUseCase{
    private let provider: MoyaProvider<MTG_Model>
    private let decoder: JSONDecoder
    
    public init(provider:MoyaProvider<MTG_Model> = .init(manager: Alamofire.SessionManager.standardManager), decoder:JSONDecoder = JSONDecoder.standardDecoder) {
        self.provider = provider
        self.decoder = decoder
    }
    
    private func performFetchCards(from set:MetaCardSet, page: Int, handler: @escaping (Domain.Result<[Card]>) -> ()){
        requestCards(from: set, page: page) { (result) in
            switch result {
            case .success(let cards):
                if (cards.count == 0){
                    handler( Domain.Result.success(cards) )
                } else {
                    self.performFetchCards(from: set, page: page+1, handler: { (nextResult) in
                        switch nextResult {
                        case .success(let moreCards):
                            handler(Domain.Result.success(cards+moreCards))
                        case .failure(let error):
                            handler(Domain.Result.failure(error))
                        }
                    })
                }
            case .failure(let error):
                handler(Domain.Result.failure(error))
            }
        }
        
    }
    
    private func requestCards(from set:MetaCardSet, page: Int, handler: @escaping (Domain.Result<[Card]>) -> ()){
        provider.request(.getCards(set: set.code, page: page)) { (result) in
            switch result{
            case let .success(response):
                do {
                    let values = try response.map([Card].self, atKeyPath: "cards", using: self.decoder, failsOnEmptyData: false)
                    handler(Domain.Result.success(values))
                } catch {
                    handler(Domain.Result
                        .failure(NetworkDomainError(errorCode: NetworkErrorCode.decodingError, error: error).value() )
                    )
                }
            case let .failure(error):
                handler(Domain.Result
                    .failure(NetworkDomainError(errorCode: NetworkErrorCode.responseError, error: error).value() )
                )
            }
        }
    }
    
    public func fetchCards(from set: MetaCardSet, handler: @escaping (Domain.Result<[Card]>) -> ()) {
        performFetchCards(from: set, page: 1) { (result) in
            switch result {
            case .success(let cards):
                print(cards.count)
            case .failure(let error):
                print(error.errorCode)
            }
            handler(result)
            
        }
    }
    
    public func fetchCards(filter name: String, handler: @escaping (Domain.Result<[Card]>) -> ()) {
        handler(Domain.Result.success([Card]()))
    }
    
    
}
