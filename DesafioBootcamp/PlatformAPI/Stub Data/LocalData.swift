//
//  EmptyData.swift
//  PlatformAPI
//
//  Created by g.guimaraes on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

public struct LocalData {
    public static var emptyCards: Data {
        return "{\"cards\":[]}".utf8Encoded
    }
    
    public static var emptySets: Data {
        return "{\"sets\":[]}".utf8Encoded
    }
    
    public static func localDataWith(_ urlPath: String) -> Data? {
        let url = Bundle(for: MTG_Service.self).url(forResource: urlPath, withExtension: "json") ?? URL(fileURLWithPath: "")
        return try? Data(contentsOf: url)
    }
}
