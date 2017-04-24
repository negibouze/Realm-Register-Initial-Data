//
//  DBBase.swift
//  Realm-Register-Initial-Data
//
//  Created by 板倉義晃 on 2017/04/24.
//  Copyright © 2017 板倉義晃. All rights reserved.
//

import Foundation
import RealmSwift

/* 基底 */
class DBBase: Object {
    dynamic var id = 0
    dynamic var name = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
