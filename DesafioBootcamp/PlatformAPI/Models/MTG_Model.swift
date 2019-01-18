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

public enum MTG_Model{
    case getCards(set:String, page: Int)
    case getSearchedCards(query: String, page: Int)
    case getMetaSets(page: Int)
}

extension MTG_Model: Moya.TargetType{
    public var baseURL: URL { return URL(string: "https://api.magicthegathering.io/v1")! }
    
    public var path: String {
        switch self {
        case .getCards(_, _), .getSearchedCards(_, _):
            return "/cards"
        case .getMetaSets(_):
            return "/sets"
        }
    }
    
    public var method: Moya.Method {
        switch self{
        default:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self{
        case .getMetaSets(let page):
            return LocalData.localDataWith("sets_stub_\(page)") ?? LocalData.emptySets
        case .getCards(let set, let page):
            return LocalData.localDataWith("cards_stub_\(set)_\(page)") ?? LocalData.emptyCards
        case .getSearchedCards(let query, let page):
            return LocalData.localDataWith("cards_stub_query_\(query)_\(page)") ?? LocalData.emptyCards
        }
    }
    
    public var task: Task {
        switch self {
        case let .getCards(set, page):
            return .requestParameters(parameters: ["set": set, "page": page], encoding: URLEncoding.queryString)
        case .getSearchedCards(let query, let page):
            return .requestParameters(parameters: ["name": query, "page": page], encoding: URLEncoding.queryString)
        case .getMetaSets(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }

}
