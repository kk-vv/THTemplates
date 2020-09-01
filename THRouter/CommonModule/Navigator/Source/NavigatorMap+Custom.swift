//
//  NavigatorMap+App.swift
//

import UIKit
import URLNavigator
import SKPhotoBrowser
/// Add custom router regist
extension NavigatorMap {
    
    func registerCustom(navigator: NavigatorType) {
        addRegister()
        addHandler()
    }
    
    private func addRegister() {
        THNavigator.navigator.register(.showImage) { (_, _, context) -> UIViewController? in
            guard let router = context as? Router,
                case let .showImage(imgList, pageIndex) = router.parameter,
                let images = imgList, !images.isEmpty else {
                    return nil
            }
            var index = pageIndex ?? 0
            if index >= images.count {
                index = 0
            }
            let photos = images.map { SKPhoto.photoWithImage($0) }
            var photoBrowser: SKPhotoBrowser
            photoBrowser = SKPhotoBrowser(photos: photos, initialPageIndex: index)
            photoBrowser.hidesBottomBarWhenPushed = true
            return photoBrowser

        }
    }
    
    private func addHandler() {
         THNavigator.navigator.handle(.safari) { _, _, context in
            guard let router = context as? Router,
                case let .safari(url) = router.parameter,
                let urlString = url, let openURL = URL(string: urlString) else {
                    return false
            }
            if UIApplication.shared.canOpenURL(openURL) {
                UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
            }
            return true
        }
    }
}
