//
//  NavigatorType+Application.swift
//

import Foundation
import URLNavigator

extension NavigatorType {

    /// navigate to url page
    ///
    /// - Parameter urlString: router url string
    func handleOpenURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        handleOpenURL(url)
    }

    /// navigate to url page
    ///
    /// - Parameter url: router url
    func handleOpenURL(_ url: URL) {
        if THNavigator.shared.isEnable,
            let viewController = UIViewController.topMost,
            viewController.isViewLoaded, viewController.view.window != nil {
             THNavigator.navigator.open(url, useCustomHandler: true)
        } else {
            // save open url
            THNavigator.shared.cache(router: url)
        }
    }

    /// switch to tab
    ///
    /// - Parameter selectedIndex: tabBar index
    func openMainTab(_ selectedIndex: Int) {
        let topViewController = UIViewController.topMost
        if let navigationController = topViewController?.navigationController,
            let tabBarController = topViewController?.tabBarController {
            if navigationController.viewControllers.count > 1 {
                navigationController.popToRootViewController(animated: false)
            }
            if selectedIndex != tabBarController.selectedIndex {
                tabBarController.selectedIndex = selectedIndex
            }
        }
    }
}
