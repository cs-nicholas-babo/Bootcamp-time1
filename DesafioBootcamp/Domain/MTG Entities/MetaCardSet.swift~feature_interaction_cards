//
//  Set.swift
//  Domain
//
//  Created by g.guimaraes on 14/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public struct MetaCardSet {
    public let code: String
    public let name: String
    
    public init(code: String, name: String) {
        self.code = code
        self.name = name
    }
}

extension MetaCardSet: Hashable {
    public static func == (lhs: MetaCardSet, rhs: MetaCardSet) -> Bool {
        return (lhs.code == rhs.code)
    }
    
    public var hashValue: Int {
        return code.hashValue
    }
}

extension MetaCardSet: Codable {
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.code = try container.decode(String.self, forKey: .code)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.code, forKey: .code)
        try container.encode(self.name, forKey: .name)
    }
}
