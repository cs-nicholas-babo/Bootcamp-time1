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
        
        let sets = [MockValues.cardSet, MockValues.cardSet, MockValues.cardSet, MockValues.cardSet]
        let cards = MockValues.cardArray
        
        let titles = sets.map({ (arg0) -> String in
            let (set, _) = arg0
            return set.name
        })
                
    }
    
}
