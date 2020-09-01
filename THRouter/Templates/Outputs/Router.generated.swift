// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
//  Router.stencil.swift
//
import UIKit
#if canImport(ObjectMapper)
import ObjectMapper
#endif

#if canImport(HandyJSON)
import HandyJSON
#endif


// swiftlint:disable all
public enum RouterType: String {
    /// RouterType: Model Param Test Page
    case modelParams = "/model_params"
    /// RouterType: 
    case safari = "/safari"
    /// RouterType: 
    case showImage = "/show_image"
    /// RouterType: Single Param Test Page
    case singleParam = "/single_param"
    /// RouterType: Call InitMethod Test Page
    case useInitMethod = "/use_init_method"

    var name: String {
        switch self {
        case .modelParams:
            return "Model Param Test Page"
        case .safari:
            return ""
        case .showImage:
            return ""
        case .singleParam:
            return "Single Param Test Page"
        case .useInitMethod:
            return "Call InitMethod Test Page"
        }
    }
}

extension ModelParamsViewController: RouterControllerType {
    var routerType: RouterType { return .modelParams }
}
extension RouterExternalViewController: RouterControllerType {
    var routerType: RouterType { return .safari }
}
extension RouterPhotoViewController: RouterControllerType {
    var routerType: RouterType { return .showImage }
}
extension SingleParamViewController: RouterControllerType {
    var routerType: RouterType { return .singleParam }
}
extension UseInitMethodViewController: RouterControllerType {
    var routerType: RouterType { return .useInitMethod }
}

// swiftlint:disable all
public enum RouterParameter {
    case modelParams(codableModel: CodableModel?, handyjsonModel: HandyJSONModel?, mapperModel: ObjectMapperModel?)
    case safari(url: String?)
    case showImage(images: [UIImage]?, index: Int?)
    case singleParam(navTitle: String?)
    case useInitMethod(color: UIColor?, navTitle: String?)

    init?(urlScheme: String) {
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
        guard let parameter = RouterParameter(type: type, parameter: url.queryParameters) else {
            return nil
        }
        self = parameter
    }

    init?(type: RouterType, parameter: [String: Any] = [:]) {
        do {
            switch type {
            case .modelParams:
                var codableModel: CodableModel?
                let codableModelTemp: String? = try parameter.get("codable_model")
                if let codableModelTemp = codableModelTemp {
                    codableModel = codableModelTemp.map(CodableModel.self)
                } else {
                    codableModel = nil
                }
                var handyjsonModel: HandyJSONModel?
                let handyjsonModelTemp: String? = try parameter.get("handyjson_model")
                if let handyjsonModelTemp = handyjsonModelTemp, let handyjsonModelModel = HandyJSONModel.deserialize(from: handyjsonModelTemp) {
                    handyjsonModel = handyjsonModelModel
                } else {
                    handyjsonModel = nil
                }
                var mapperModel: ObjectMapperModel?
                let mapperModelTemp: String? = try parameter.get("mapper_model")
                if let mapperModelTemp = mapperModelTemp {
                    mapperModel = Mapper<ObjectMapperModel>().map(JSONString: mapperModelTemp)
                } else {
                    mapperModel = nil
                }
                self = .modelParams(codableModel: codableModel, handyjsonModel: handyjsonModel, mapperModel: mapperModel)
            case .safari:
                let url: String? = try parameter.get("url")
                self = .safari(url: url)
            case .showImage:
                var images: [UIImage]?
                let imagesTemp: String? = try parameter.get("images")
                if let imagesTemp = imagesTemp {
                    if let imagesArray = RouterParser.parseJSONString(JSONString: imagesTemp) as? [UIImage]? {
                        images = imagesArray
                    }
                } else {
                    images = nil
                }
                let index: Int? = try parameter.get("index")
                self = .showImage(images: images, index: index)
            case .singleParam:
                let navTitle: String? = try parameter.get("nav_title")
                self = .singleParam(navTitle: navTitle)
            case .useInitMethod:
                let color: UIColor? = try parameter.get("color")
                let navTitle: String? = try parameter.get("nav_title")
                self = .useInitMethod(color: color, navTitle: navTitle)
            }
        } catch {
            return nil
        }
    }

    var type: RouterType {
        switch self {
        case .modelParams:
            return .modelParams
        case .safari:
            return .safari
        case .showImage:
            return .showImage
        case .singleParam:
            return .singleParam
        case .useInitMethod:
            return .useInitMethod
        }
    }

    var parameters: [String: Any] {
        switch self {
        case let .modelParams(codableModel, handyjsonModel, mapperModel):
            var parameter: [String: Any] = [:]
            parameter["codable_model"] = codableModel
            parameter["handyjson_model"] = handyjsonModel
            parameter["mapper_model"] = mapperModel
            return parameter
        case let .safari(url):
            var parameter: [String: Any] = [:]
            parameter["url"] = url
            return parameter
        case let .showImage(images, index):
            var parameter: [String: Any] = [:]
            parameter["images"] = images
            parameter["index"] = index
            return parameter
        case let .singleParam(navTitle):
            var parameter: [String: Any] = [:]
            parameter["nav_title"] = navTitle
            return parameter
        case let .useInitMethod(color, navTitle):
            var parameter: [String: Any] = [:]
            parameter["color"] = color
            parameter["nav_title"] = navTitle
            return parameter
        }
    }
}

extension RouterType {
    // Full URL
    var url: String {
        return NavigatorMap.scheme + "://" + NavigatorMap.host + rawValue
    }
}

public enum RouterError: Error {
    case typeNotMatch
}
