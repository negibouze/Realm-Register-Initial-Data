//
//  RealmInitializer.swift
//  Realm-Register-Initial-Data
//
//  Created by 板倉義晃 on 2017/04/24.
//  Copyright © 2017 板倉義晃. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmInitializer {

    static func setUp() {
        // シードデータ作成
        insertSeedData(PrefectureSeed())
        insertSeedData(OwnerSeed())
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    private static func delete<T: RealmSeed>(_ seed: T) where T.SeedType: DBBase {
        // realm
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(T.SeedType.self))
        }
    }

    // Realmファイルを作成する
    private static func insertSeedData<T: RealmSeed>(_ seed: T) where T.SeedType: DBBase {
        // realm
        let realm = try! Realm()
        try! realm.write {
            T.items().forEach { val in
                realm.add(val, update: true)
            }
        }
    }
}
