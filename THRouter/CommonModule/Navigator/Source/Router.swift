//
//  Router.swift
//

import UIKit
import URLNavigator

// Router
public struct Router {
    
    var type: RouterType
    var parameter: RouterParameter
    var context: [String: Any] = [:]
    
    /// init
    ///
    /// - Parameter parameter: RouterParameter
    init(_ parameter: RouterParameter) {
        self.type = parameter.type
        self.parameter = parameter
    }
    
    /// urlScheme init
    /// - Parameters:
    ///   - urlScheme: url
    ///   - context: extral params
    init?(_ urlScheme: String, context: [String: Any]? = nil) {
        guard let url = URL(string: urlScheme) else {
            return nil
        }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.query = nil
        guard let path = urlComponents?.path else {
            return nil
        }
        guard let type = RouterType(rawValue: path) else {
            return nil
        }
        self.context = urlScheme.queryParameters
        if let extraContext = context {
            self.context.merge(extraContext) { (_, new) in new }
        }
        guard let parameter = RouterParameter(type: type, parameter: self.context) else {
            return nil
        }
        self.type = type
        self.parameter = parameter
    }
    
    /// router init
    ///
    /// - Parameters:
    ///   - type: RouterType
    ///   - context: params
    init(_ type: RouterType, context: [String: Any] = [:]) {
        self.type = type
        guard let parameter = RouterParameter(type: type, parameter: context) else {
            fatalError("router parameter interval error")
        }
        self.parameter = parameter
        self.context = context
    }

    ///
    /// - Returns: true: use present transition
    func isPresent() -> Bool {
        if let transition = context["transition"] as? String,
            transition == "present" {
            return true
        }
        return false
    }
    
}
