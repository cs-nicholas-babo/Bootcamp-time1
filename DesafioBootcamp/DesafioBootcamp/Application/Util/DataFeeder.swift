//
//  DataFeeder.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

protocol DataFeeder {
    associatedtype FeedData
    func feed(data: FeedData)
    
}
