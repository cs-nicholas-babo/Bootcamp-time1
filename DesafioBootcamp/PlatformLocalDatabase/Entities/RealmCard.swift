//
//  RealmCard.swift
//  PlatformLocalDatabase
//
//  Created by g.guimaraes on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import RealmSwift

public final class RealmCard: RealmSwift.Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var setCode: String = ""
    let types: List<RealmCardType> = List<RealmCardType>()
    
    override public static func primaryKey() -> String {
        return "id"
    }
}
