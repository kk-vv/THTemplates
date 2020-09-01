//
//  Dictionary+Extension.swift
//

import Foundation

public enum DictionaryError: Error {
    case notFound
    case typeNotMatch
}

protocol OptionalProtocol {}

extension Optional: OptionalProtocol {}

extension Dictionary where Key == String {
    
    public func get<T>(_ key: String) throws -> T {
        guard let value = self[key] else {
            throw DictionaryError.notFound
        }
        if let transformedValue = transform(value: value, toType: T.self) as? T {
            return transformedValue
        } else {
            throw DictionaryError.typeNotMatch
        }
    }
    
    public func get<T: ExpressibleByNilLiteral>(_ key: String) throws -> T {
        guard let value = self[key] else {
            if T.self is OptionalProtocol.Type {
                return nil
            } else {
                throw DictionaryError.notFound
            }
        }
        if let transformedValue = transform(value: value, toType: T.self) as? T {
            return transformedValue
        } else {
            if T.self is OptionalProtocol.Type {
                return nil
            } else {
                throw DictionaryError.typeNotMatch
            }
        }
    }
    
    public func transform<T>(value: Value, toType: T.Type) -> Any? {
        if value is NSNull {
            return nil
        } else if let array = value as? [Any] {
            if toType is [Any].Type || toType is Optional<[Any]>.Type {
                return array
            } else if toType is [[String: Any]].Type || toType is Optional<[[String: Any]]>.Type {
                return array
            } else {
                return nil
            }
        } else if let dictionary = value as? [String: Any] {
            if toType is [String: Any].Type || toType is Optional<[String: Any]>.Type {
                return dictionary
            } else {
                return nil
            }
        } else {
            // convert string to generic type
            if toType is String.Type || toType is Optional<String>.Type {
                if let stringValue = value as? String {
                    return stringValue
                } else if let numberValue = value as? NSNumber {
                    // convert number to string
                    return numberValue.stringValue
                }
            } else if toType is Int.Type || toType is Optional<Int>.Type {
                if let intValue = value as? Int {
                    return intValue
                } else if let stringValue = value as? String {
                    // convert string to int
                    return Int(stringValue)
                }
            } else if toType is Double.Type || toType is Optional<Double>.Type {
                if let doubleValue = value as? Double {
                    return doubleValue
                } else if let stringValue = value as? String {
                    // convert string to double
                    return Double(stringValue)
                }
            } else if toType is Bool.Type || toType is Optional<Bool>.Type {
                if let boolValue = value as? Bool {
                    return boolValue
                } else if let stringValue = value as? String {
                    // convert string to bool
                    return Bool(stringValue)
                }
            }
        }
        return nil
    }
    
}
