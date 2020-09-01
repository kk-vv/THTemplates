//
//  UserModel.swift
//  THRouter
//
//  Created by Juan Felix on 2020/8/31.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import Foundation
import HandyJSON
import ObjectMapper

public class CodableModel: Codable, CustomStringConvertible {
    var name: String =  ""
    var tel: String = ""
   
    public var description: String {
        return "Name: \(name) \n Tel: \(tel)"
    }
}

public class HandyJSONModel: HandyJSON, CustomStringConvertible {
    public required init() {
    }
    
    var name: String = ""
    var tel: String = ""
    
    public var description: String {
        return "Name: \(name) \n Tel: \(tel)"
    }
}

public class ObjectMapperModel: Mappable, CustomStringConvertible {
    var name: String = ""
    var tel: String = ""
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        tel <- map["tel"]
    }
    
    public var description: String {
        return "Name: \(name) \n Tel: \(tel)"
    }
}
