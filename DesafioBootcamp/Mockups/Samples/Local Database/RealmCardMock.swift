//
//  RealmCardMock.swift
//  Mockups
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import PlatformLocalDatabase
import Domain

struct RealmCardMock{
    
    static var emptyCard: RealmCard{
        return RealmCard()
    }
    
    static var card1: RealmCard{
        let card = RealmCard()
        card.id = "uuid1"
        card.name = "Elfo bem loco"
        card.setCode = ""
        return card
    }
    
}
