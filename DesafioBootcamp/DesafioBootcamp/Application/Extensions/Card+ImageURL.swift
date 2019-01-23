//
//  Card+ImageURL.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain

extension Card {
    func literalImageURL() -> URL?{
        return URL(string: imageURL ?? "")
    }
}
