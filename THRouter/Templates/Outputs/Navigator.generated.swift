// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//  Router.stencil.swift

import URLNavigator

// swiftlint:disable all
extension NavigatorMap {

    func registerGenerated(navigator: NavigatorType) {
        navigator.register(.modelParams) { _, _, context in
            guard let router = context as? Router,
                case let .modelParams(codableModel, handyjsonModel, mapperModel) = router.parameter else {
                return nil
            }
            let viewController = ModelParamsViewController()
            if codableModel != nil {
                viewController.codableModel = codableModel
            }
            if handyjsonModel != nil {
                viewController.handyjsonModel = handyjsonModel
            }
            if mapperModel != nil {
                viewController.mapperModel = mapperModel
            }
            viewController.hidesBottomBarWhenPushed = true
            return viewController
        }   
        navigator.register(.singleParam) { _, _, context in
            guard let router = context as? Router,
                case let .singleParam(navTitle) = router.parameter else {
                return nil
            }
            let viewController = SingleParamViewController()
            if navTitle != nil {
                viewController.navTitle = navTitle
            }
            viewController.hidesBottomBarWhenPushed = true
            return viewController
        }   
        navigator.register(.useInitMethod) { _, _, context in
            guard let router = context as? Router,
                case let .useInitMethod(color, navTitle) = router.parameter else {
                return nil
            }
            let viewController = UseInitMethodViewController(color: color, navTitle: navTitle)
            viewController.hidesBottomBarWhenPushed = true
            return viewController
        }   
    }

}
