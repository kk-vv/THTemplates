//
//  EquatableModel.swift
//  THRouter
//
//  Created by Juan Felix on 2020/9/1.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import Foundation

struct EquatableModel: Codable, AutoEquatable {
    var uuid: String
    var name: String
    var tel: String
    var sex: UInt?
    var address: String?
}
