//
//  Owner.swift
//  Realm-Register-Initial-Data
//
//  Created by 板倉義晃 on 2017/04/24.
//  Copyright © 2017 板倉義晃. All rights reserved.
//

import Foundation
import RealmSwift

/* オーナー */
class Owner: DBBase {
    var dogs = List<Dog>()
}
