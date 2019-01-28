//
//  RealmFactory.swift
//  PlatformLocalDatabase
//
//  Created by miguel.horta.nery on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//


import RealmSwift

protocol RealmFactory {}

extension RealmFactory {
    static func realm() -> Realm {
        return try! Realm()
    }
}
