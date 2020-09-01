//
//  RouterParser.swift
//

import Foundation

public struct RouterParser {
    
    /// Convert a JSON String into a Dictionary<String, Any> using NSJSONSerialization
    public static func parseJSONStringIntoDictionary(JSONString: String) -> [String: Any]? {
        let parsedJSON: Any? = RouterParser.parseJSONString(JSONString: JSONString)
        return parsedJSON as? [String: Any]
    }
    
    /// Convert a JSON String into an Object using NSJSONSerialization
    public static func parseJSONString(JSONString: String) -> Any? {
        let data = JSONString.data(using: String.Encoding.utf8, allowLossyConversion: true)
        if let data = data {
            let parsedJSON: Any?
            do {
                parsedJSON = try JSONSerialization.jsonObject(with: data,
                                                              options: JSONSerialization.ReadingOptions.allowFragments)
            } catch let error {
                print(error)
                parsedJSON = nil
            }
            return parsedJSON
        }
        
        return nil
    }
    
}
