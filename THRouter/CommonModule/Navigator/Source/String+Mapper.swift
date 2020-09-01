//
//  String+Mapper.swift
//

import Foundation

extension String {
    public func map<D: Decodable>(_ type: D.Type) -> D? {
        let decoder = JSONDecoder()
        guard let jsonData = data(using: .utf8), !jsonData.isEmpty else {
            return nil
        }
        do {
            return try decoder.decode(D.self, from: jsonData)
        } catch {
            return nil
        }
    }
    
    var urlParameterEncoded: String {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
    }
}
