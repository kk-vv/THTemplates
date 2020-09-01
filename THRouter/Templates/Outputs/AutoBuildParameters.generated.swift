// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
//  AutoBuildParameters.stencil.swift
//

// swiftlint:disable all
// MARK: LoginAPI API Parameters
extension LoginAPI {
    var parameters: [String: Any] {
        switch self {
        case let .login(userName, password):
            var params = [String: Any]()
            if !userName.isEmpty {
                params["userName"] = userName
            }
            if let password = password {
                if !password.isEmpty {
                    params["password"] = password
                }
            }
            return params
        case .logout:
            return [:]
        }
    }
}
