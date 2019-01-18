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
    
    private func performFetchCards(){
        
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
    
    private func requestCards(query:String, handler: @escaping (Domain.Result<[Card]>) -> ()){
        provider.request(.getSearchedCards(query: query)) { (result) in
            switch result{
            case .success(let response):
                do {
                    let values = try response.map([Card].self, atKeyPath: "cards", using: self.decoder, failsOnEmptyData: false)
                    handler(Domain.Result.success(values))
                } catch {
                    handler(Domain.Result
                        .failure(NetworkDomainError(errorCode: NetworkErrorCode.decodingError, error: error).value() )
                    )
                }
            case .failure(let error):
                handler(Domain.Result
                    .failure(NetworkDomainError(errorCode: NetworkErrorCode.responseError, error: error).value() )
                )
            }
        }
    }
    
    private func requestSets(handler: @escaping (Domain.Result<[MetaCardSet]>) -> ()){
        provider.request(.getMetaSets) { (result) in
            switch result{
            case let .success(response):
                do {
                    let values = try response.map([MetaCardSet].self, atKeyPath: "sets", using: self.decoder, failsOnEmptyData: false)
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
        self.requestCards(from: set, page: 1) { (res: Domain.Result<[Card]>) in
            switch res {
            case .success(let me):
                handler(Domain.Result.success(me))
            case .failure(let no):
                handler(Domain.Result.failure(no))
            }
        }
    }
    
    public func fetchCards(filter name: String, handler: @escaping (Domain.Result<[Card]>) -> ()) {
        self.requestCards(query: name) { (result) in
            switch result{
            case .success(let cards):
                handler(Domain.Result.success(cards))
            case .failure(let error):
                handler(Domain.Result.failure(error))
            }
        }
    }
    
    public func fetchSets(handler: @escaping (Domain.Result<[MetaCardSet]>) -> ()){
        self.requestSets { (result) in
            switch result{
            case .success(let values):
                handler(Domain.Result.success(values))
            case .failure(let error):
                handler(Domain.Result.failure(error))
            }
        }
    }
    
    
}
