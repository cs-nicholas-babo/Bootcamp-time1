//
//  CardType.swift
//  Domain
//
//  Created by g.guimaraes on 14/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public struct CardType {
    public let name: String
    
    public init(name: String){
        self.name = name
    }
}

extension CardType: Hashable { }

extension CardType: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.name, forKey: .name)
    }
    
}
