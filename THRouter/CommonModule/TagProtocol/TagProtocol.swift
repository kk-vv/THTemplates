//
//  TagProtocol.swift
//  THRouter
//
//  Created by Juan Felix on 2020/8/31.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import Foundation

/// for autoEqualtable generate
protocol AutoEquatable { }

/// Auto create parameters for Moya
protocol AutoBuildParameters {
    var parameters: [String: Any] { get }
}

extension AutoBuildParameters {
    var parameters: [String: Any] { return [:] }
}

// Routable protocol
protocol Routable {}
// Auto generate handle
protocol InitRoutable: Routable {}
// Custom config handle
protocol CustomRoutable: Routable {}

protocol RouterControllerType {
    var routerType: RouterType { get }
}

enum RouterTransitionType: String {
    case present
    case push
}
