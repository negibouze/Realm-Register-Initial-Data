//
//  OwnerSeed.swift
//  Realm-Register-Initial-Data
//
//  Created by 板倉義晃 on 2017/04/24.
//  Copyright © 2017 板倉義晃. All rights reserved.
//

import RealmSwift

struct OwnerSeed: RealmSeed {
    typealias SeedType = Owner
    static var values: [[Any]] {
        return OwnerData.data
    }
}

extension OwnerSeed {
    static func items() -> [SeedType] {
        return values.map { val in
            let id = val[0] as! Int
            let t = SeedType()
            t.id = id
            t.name = val[1] as! String
            let l = { (_ ownerId: Int) -> [Dog] in
                let data = DogData.get(ownerId)
                return data.map { v in
                    let d = Dog()
                    d.id = v[0] as! Int
                    d.name = v[1] as! String
                    return d
                }
            }(id)
            t.dogs = List<Dog>(l)
            return t
        }
    }
}

struct OwnerData {
    static var data: [[Any]] {
        return [
            [1, "オーナー1"],
            [2, "オーナー2"],
            [3, "オーナー3"],
            [4, "オーナー4"],
            [5, "オーナー5"]
        ]
    }
}

struct DogData {
    static let data: [Int: [[Any]]] = [
        1: [
            [11, "オーナー1の犬1"],
            [12, "オーナー1の犬2"],
            [13, "オーナー1の犬3"],
            [14, "オーナー1の犬4"],
            [15, "オーナー1の犬5"]
        ],
        2: [
            [21, "オーナー2の犬1"],
            [22, "オーナー2の犬2"],
            [23, "オーナー2の犬3"]
        ],
        3: [
            [31, "オーナー3の犬1"]
        ],
        4: [
            [41, "オーナー4の犬1"],
            [42, "オーナー4の犬2"],
            [43, "オーナー4の犬3"],
            [44, "オーナー4の犬4"]
        ],
        5: [
            [51, "オーナー5の犬1"],
            [52, "オーナー5の犬2"]
        ]
    ]
    
    static func get(_ ownerId: Int) -> [[Any]] {
        return data[ownerId]!
    }
}
