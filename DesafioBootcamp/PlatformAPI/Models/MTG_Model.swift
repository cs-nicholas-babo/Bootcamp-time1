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
    case getCards(set:String, page:Int)
    case getSearchedCards(query: String)
    case getMetaSets
}

extension MTG_Model: Moya.TargetType{
    public var baseURL: URL { return URL(string: "https://api.magicthegathering.io/v1")! }
    
    public var path: String {
        switch self {
        case .getCards(_, _), .getSearch(_, _):
            return "/cards"
        case .getMetaSets(_):
            return "/sets"
        case .getSearchedCards(let query):
            return "/cards?name=\(query)"
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
        case .getMetaSets:
            let fileURL = Bundle(for: APIBundle.self).url(forResource: "sets_stub", withExtension: "json") ?? URL(fileURLWithPath: "")
            let data = try? Data(contentsOf: fileURL)
            return data ?? "{}".utf8Encoded
        case .getCards(let set, let page):
            let fileURL = Bundle(for: APIBundle.self).url(forResource: "cards_stub_\(set)_\(page)", withExtension: "json") ?? URL(fileURLWithPath: "")
            let data = try? Data(contentsOf: fileURL)
            return data ?? "{}".utf8Encoded
        case .getSearchedCards(let query):
            let fileURL = Bundle(for: APIBundle.self).url(forResource: "cards_stub_query_\(query)", withExtension: "json") ?? URL(fileURLWithPath: "")
            let data = try? Data(contentsOf: fileURL)
            return data ?? "{}".utf8Encoded
        }
    }
    
    public var task: Task {
        switch self{
        case let .getCards(set, page):
            return .requestParameters(parameters: ["set":set, "page":page], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    

}

class APIBundle{
    
}
