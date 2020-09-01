//
//  THNavigator.swift
//  THNavigator
//
//  Created by Juan Felix on 2020/8/31.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import Foundation
import URLNavigator

public class THNavigator {
    public static let shared = THNavigator()
    
    public static let navigator = Navigator()
    
    ///default true, if disable like login invalid set to false and call cache(router:)
    public var isEnable: Bool = true
    
    private var routerURL: URL?
    
    private init() {
    }
    
    func load() {
        NavigatorMap().initialize()
    }
    
    /// call this to cache url  if login invalid
    public func cache(router: URL) {
        routerURL = router
    }
    
    /// call this after relaunch to check the lastest cache router
    public func checkLatestRouter() {
        if let url = routerURL {
            THNavigator.navigator.open(url, useCustomHandler: true)
        }
    }
    
}
