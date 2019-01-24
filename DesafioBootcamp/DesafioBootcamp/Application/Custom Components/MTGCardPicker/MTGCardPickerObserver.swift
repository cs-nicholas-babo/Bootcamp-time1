//
//  MTGCardPickerObserver.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

protocol MTGCardPickerObserver : class {
    func didChangeTo(row: Int)
}
