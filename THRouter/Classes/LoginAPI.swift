//
//  LoginAPI.swift
//  THRouter
//
//  Created by Juan Felix on 2020/9/1.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import Foundation

enum LoginAPI: AutoBuildParameters {
    case login(userName: String, password: String?)
    case logout
    
    var moyaParameters: [String: Any] {
        return parameters
    }
}
