//
//  CardSetListFactoryImplementation.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

final class CardSetListFactoryImplementation: CardSetListFactory{
    static func makeMTGCardGateway() -> MTGCardGateway {
        let localDatabaseGateway = LocalDatabaseGateway()
        return localDatabaseGateway
    }
    
}
