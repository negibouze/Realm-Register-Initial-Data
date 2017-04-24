//
//  RealmSeed.swift
//  Realm-Register-Initial-Data
//
//  Created by 板倉義晃 on 2017/04/24.
//  Copyright © 2017 板倉義晃. All rights reserved.
//

protocol RealmSeed {
    associatedtype SeedType: DBBase
    static var values: [[Any]] { get }
    static func items() -> [SeedType]
}

extension RealmSeed {
    static func items() -> [SeedType] {
        return values.map { val in
            let t = SeedType()
            t.id = val[0] as! Int
            t.name = val[1] as! String
            return t
        }
    }
}
