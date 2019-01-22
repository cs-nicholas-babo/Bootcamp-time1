//
//  CardSetListTableViewDataSourceSpec.swift
//  DesafioBootcampTests
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Nimble
import Quick
import UIKit
import Foundation
import Domain

final class CardSetListTableViewDataSourceSpec: QuickSpec{
    
    override func spec() {
        
        let sets = [MockValues.cardSetMock, MockValues.cardSetMock, MockValues.cardSetMock, MockValues.cardSetMock]
        let cards = MockValues.cardsMock
        
        let titles = sets.map({ (arg0) -> String in
            let (set, _) = arg0
            return set.name
        })
                
    }
    
}
