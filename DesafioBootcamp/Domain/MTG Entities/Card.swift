//
//  Card.swift
//  Domain
//
//  Created by g.guimaraes on 14/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public struct Card {
    public let id: String
    public let name: String
    public let setCode: String
    public let types: Set<CardType>
}

extension Card: Hashable {
    public static func == (lhs: Card, rhs: Card) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    public var hashValue: Int {
        return self.id.hashValue
    }
}

extension Card: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case types = "types"
        case setCode = "set"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.setCode = try container.decode(String.self, forKey: .setCode)
        if let decodedSet = try container.decodeIfPresent([String].self, forKey: .types){
           self.types = Set(decodedSet.map({ CardType(name: $0) }))
        } else {
            self.types = Set<CardType>()
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.setCode, forKey: .setCode)
        let arrayTypes = self.types.map({ $0.name })
        try container.encode(arrayTypes, forKey: .types)
    }
}
