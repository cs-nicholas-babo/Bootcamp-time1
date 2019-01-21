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
        card.name = "name1"
        card.setCode = "code1"
        return card
    }
    
    static var card2: RealmCard{
        let card = RealmCard()
        card.id = "uuid2"
        card.name = "name2"
        card.setCode = "code2"
        return card
    }
    
    static var card3: RealmCard{
        let card = RealmCard()
        card.id = "uuid3"
        card.name = "name3"
        card.setCode = "code3"
        return card
    }
    
}
